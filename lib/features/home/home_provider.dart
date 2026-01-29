import 'package:cocktail_master/data/api/cocktail_repository.dart';
import 'package:cocktail_master/data/models/cocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class HomeState extends _$HomeState {
  @override
  FutureOr<List<Cocktail>> build() {
    return loadRandom();
  }

  Future<List<Cocktail>> loadRandom() async {
    final repo = ref.read(cocktailRepositoryProvider);
    return repo.getRandomCocktails();
  }

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(cocktailRepositoryProvider);
      final result = await repo.searchCocktails(query);
      state = AsyncValue.data(result);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
