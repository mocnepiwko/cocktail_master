import 'package:cocktail_master/core/lang/app_strings.dart';
import 'package:cocktail_master/core/theme/theme_provider.dart';
import 'package:cocktail_master/data/api/cocktail_repository.dart'; // <--- НЕ ЗАБУДЬ ЭТОТ ИМПОРТ
import 'package:cocktail_master/data/database/local_repository.dart';
import 'package:cocktail_master/features/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cocktailState = ref.watch(homeStateProvider);
    final isDarkMode = ref.watch(themeModeNotifierProvider);
    final currentLang = ref.watch(languageNotifierProvider);
    final strings = AppStrings(currentLang);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.get('title'),
            style: const TextStyle(
                fontSize: 18)), // Чуть уменьшил шрифт, чтобы все влезало
        actions: [
          // 🎲 КНОПКА "МНЕ ПОВЕЗЕТ" (НОВАЯ)
          IconButton(
            icon: const Icon(Icons.casino), // Иконка кубика
            tooltip: 'Random / Случайный',
            onPressed: () async {
              // 1. Показываем индикатор загрузки поверх всего
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) =>
                    const Center(child: CircularProgressIndicator()),
              );

              // 2. Делаем запрос
              final randomCocktail = await ref
                  .read(cocktailRepositoryProvider)
                  .getRandomCocktail();

              // 3. Убираем индикатор загрузки
              if (context.mounted) Navigator.pop(context);

              // 4. Если нашли - открываем
              if (randomCocktail != null && context.mounted) {
                context.goNamed('details', extra: randomCocktail);
              } else if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error loading random drink')),
                );
              }
            },
          ),

          // 🌍 Язык
          TextButton(
            onPressed: () =>
                ref.read(languageNotifierProvider.notifier).toggle(),
            child: Text(
              strings.get('lang_name'),
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 🌙 Тема (Убрали кнопку темы в "меню" или оставим? Давай оставим, но места мало)
          // Если кнопок слишком много, можно убрать тему или язык.
          // Но пока попробуем уместить.
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () =>
                ref.read(themeModeNotifierProvider.notifier).toggle(),
          ),

          // ❤️ Избранное
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => _showFavorites(context, ref, strings),
          ),
        ],
      ),
      // ... ДАЛЬШЕ КОД БЕЗ ИЗМЕНЕНИЙ (body, floatingActionButton...)
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: strings.get('search_hint'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (val) {
                if (val.trim().isEmpty) return;
                ref.read(homeStateProvider.notifier).search(val);
              },
            ),
          ),
          Expanded(
            child: cocktailState.when(
              data: (list) => GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: list.length,
                itemBuilder: (ctx, i) {
                  final cocktail = list[i];
                  return GestureDetector(
                    onTap: () {
                      context.goNamed('details', extra: cocktail);
                    },
                    child: Card(
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              cocktail.strDrinkThumb,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cocktail.strDrink,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  cocktail.strCategory ?? '',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              error: (err, _) => Center(child: Text('Error: $err')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed('add'),
        label: Text(strings.get('custom_btn')),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showFavorites(
      BuildContext context, WidgetRef ref, AppStrings strings) async {
    final repo = ref.read(localRepositoryProvider);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return FutureBuilder(
            future: repo.getAllCocktails(),
            builder: (ctx, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
              final myCocktails = snapshot.data!;

              return DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.4,
                maxChildSize: 0.95,
                expand: false,
                builder: (_, controller) => Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(strings.get('my_collection'),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const Divider(),
                      Expanded(
                        child: myCocktails.isEmpty
                            ? Center(child: Text(strings.get('empty_fav')))
                            : ListView.builder(
                                controller: controller,
                                itemCount: myCocktails.length,
                                itemBuilder: (ctx, i) {
                                  final item = myCocktails[i];
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    child: ExpansionTile(
                                      leading: const Icon(Icons.local_bar,
                                          color: Colors.pink),
                                      title: Text(item.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          item.date.toString().split(' ')[0]),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.grey),
                                        onPressed: () async {
                                          await repo.deleteCocktail(item.name);
                                          setState(() {});
                                        },
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              if (item.imagePath != null) ...[
                                                Text(strings.get('photo_web'),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(item.imagePath!
                                                        .contains('http')
                                                    ? strings.get('photo_web')
                                                    : strings
                                                        .get('photo_local')),
                                                const SizedBox(height: 10),
                                              ],
                                              if (item.instructions !=
                                                  null) ...[
                                                Text(strings.get('recipe'),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(item.instructions!),
                                                const SizedBox(height: 10),
                                              ],
                                              if (item.ingredients != null &&
                                                  item.ingredients!
                                                      .isNotEmpty) ...[
                                                Text(strings.get('ingredients'),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                ...item.ingredients!
                                                    .map((e) => Text('• $e')),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
