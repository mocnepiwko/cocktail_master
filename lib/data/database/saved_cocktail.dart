import 'package:isar/isar.dart';

part 'saved_cocktail.g.dart';

@collection
class SavedCocktail {
  Id id = Isar.autoIncrement;

  late String name;
  late DateTime date;

  String? imagePath;
  String? instructions;
  List<String>? ingredients;
}
