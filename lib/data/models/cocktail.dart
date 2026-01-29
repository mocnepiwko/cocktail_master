import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail.freezed.dart';
part 'cocktail.g.dart';

@freezed
class Cocktail with _$Cocktail {
  const Cocktail._(); // Нужно для добавления методов

  const factory Cocktail({
    required String idDrink,
    required String strDrink,
    required String strDrinkThumb,
    required String? strInstructions,
    required String? strCategory,
    // Ингредиенты (API отдает их по отдельности, возьмем основные 5)
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
  }) = _Cocktail;

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);

  // Метод, чтобы собрать ингредиенты в красивый список
  List<String> getIngredients() {
    final List<String> result = [];
    if (strIngredient1 != null)
      result.add('${strIngredient1} (${strMeasure1 ?? ""})');
    if (strIngredient2 != null)
      result.add('${strIngredient2} (${strMeasure2 ?? ""})');
    if (strIngredient3 != null)
      result.add('${strIngredient3} (${strMeasure3 ?? ""})');
    if (strIngredient4 != null)
      result.add('${strIngredient4} (${strMeasure4 ?? ""})');
    if (strIngredient5 != null)
      result.add('${strIngredient5} (${strMeasure5 ?? ""})');
    return result;
  }
}
