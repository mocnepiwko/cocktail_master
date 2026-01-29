import 'package:cocktail_master/data/database/saved_cocktail.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_repository.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarDb(IsarDbRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [SavedCocktailSchema],
    directory: dir.path,
  );
}

@riverpod
LocalRepository localRepository(LocalRepositoryRef ref) {
  return LocalRepository(ref);
}

class LocalRepository {
  final LocalRepositoryRef _ref;
  LocalRepository(this._ref);

  // Сохранить (как было)
  Future<void> saveCocktail({
    required String name,
    required DateTime date,
    String? imagePath,
    String? instructions,
    List<String>? ingredients,
  }) async {
    final isar = await _ref.read(isarDbProvider.future);
    final newCocktail = SavedCocktail()
      ..name = name
      ..date = date
      ..imagePath = imagePath
      ..instructions = instructions
      ..ingredients = ingredients;

    await isar.writeTxn(() async {
      await isar.savedCocktails.put(newCocktail);
    });
  }

  Future<List<SavedCocktail>> getAllCocktails() async {
    final isar = await _ref.read(isarDbProvider.future);
    return isar.savedCocktails.where().findAll();
  }

  Future<bool> isSaved(String name) async {
    final isar = await _ref.read(isarDbProvider.future);
    final count = await isar.savedCocktails.filter().nameEqualTo(name).count();
    return count > 0;
  }

  Future<void> deleteCocktail(String name) async {
    final isar = await _ref.read(isarDbProvider.future);
    await isar.writeTxn(() async {
      await isar.savedCocktails.filter().nameEqualTo(name).deleteAll();
    });
  }
}
