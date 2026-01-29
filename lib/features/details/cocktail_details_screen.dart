import 'package:cocktail_master/core/lang/app_strings.dart';
import 'package:cocktail_master/data/database/local_repository.dart';
import 'package:cocktail_master/data/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class CocktailDetailsScreen extends ConsumerStatefulWidget {
  final Cocktail cocktail;

  const CocktailDetailsScreen({super.key, required this.cocktail});

  @override
  ConsumerState<CocktailDetailsScreen> createState() =>
      _CocktailDetailsScreenState();
}

class _CocktailDetailsScreenState extends ConsumerState<CocktailDetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  Future<void> _checkIfSaved() async {
    final isSaved = await ref
        .read(localRepositoryProvider)
        .isSaved(widget.cocktail.strDrink);
    if (mounted) {
      setState(() {
        isFavorite = isSaved;
      });
    }
  }

  Future<void> _toggleFavorite(AppStrings strings) async {
    final repo = ref.read(localRepositoryProvider);

    if (isFavorite) {
      await repo.deleteCocktail(widget.cocktail.strDrink);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(strings.get('fav_removed'))),
        );
      }
    } else {
      await repo.saveCocktail(
        name: widget.cocktail.strDrink,
        date: DateTime.now(),
        imagePath: widget.cocktail.strDrinkThumb,
        instructions: widget.cocktail.strInstructions,
        ingredients: widget.cocktail.getIngredients(),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(strings.get('fav_added'))),
        );
      }
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Получаем словарь
    final currentLang = ref.watch(languageNotifierProvider);
    final strings = AppStrings(currentLang);
    final ingredients = widget.cocktail.getIngredients();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.cocktail.strDrink,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                ),
              ),
              background: Image.network(
                widget.cocktail.strDrinkThumb,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  final text =
                      '${strings.get('share_text')}${widget.cocktail.strDrink}\n\n'
                      '${strings.get('ingredients')}\n'
                      '${widget.cocktail.getIngredients().join('\n')}\n\n'
                      '${strings.get('recipe')}\n'
                      '${widget.cocktail.strInstructions}';
                  Share.share(text);
                },
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                  size: 28,
                ),
                onPressed: () => _toggleFavorite(strings),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.get('ingredients'),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...ingredients.map((ing) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.circle,
                                size: 8, color: Colors.orange),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(ing,
                                    style: const TextStyle(fontSize: 16))),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                  Text(
                    strings.get('recipe'),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.cocktail.strInstructions ?? 'No Instructions',
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
