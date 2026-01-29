import 'package:cocktail_master/core/config/env.dart';
import 'package:cocktail_master/data/models/cocktail.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cocktail_repository.g.dart';

@riverpod
Dio dio(DioRef ref) {
  // Настраиваем базовый адрес
  final fullUrl = '${Env.baseUrl}${Env.apiKey}/';
  return Dio(BaseOptions(
    baseUrl: fullUrl,
  ));
}

@riverpod
CocktailRepository cocktailRepository(CocktailRepositoryRef ref) {
  return CocktailRepository(ref.watch(dioProvider));
}

class CocktailRepository {
  final Dio _dio;

  CocktailRepository(this._dio);

  // 1. Загрузка списка при старте (например, Margarita)
  Future<List<Cocktail>> getRandomCocktails() async {
    try {
      final response =
          await _dio.get('search.php', queryParameters: {'s': 'Margarita'});
      final dynamic responseData = response.data['drinks'];

      if (responseData == null || responseData is! List) {
        return [];
      }

      return responseData.map((json) => Cocktail.fromJson(json)).toList();
    } catch (e) {
      return []; // Возвращаем пустой список при ошибке
    }
  }

  // 2. Поиск коктейлей (с защитой от ошибок)
  Future<List<Cocktail>> searchCocktails(String query) async {
    try {
      final response =
          await _dio.get('search.php', queryParameters: {'s': query});
      final dynamic responseData = response.data['drinks'];

      if (responseData == null || responseData is! List) {
        return [];
      }

      return responseData.map((json) => Cocktail.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  // 3. НОВЫЙ МЕТОД: Один случайный коктейль (для кубика 🎲)
  Future<Cocktail?> getRandomCocktail() async {
    try {
      final response = await _dio.get('random.php');
      final dynamic responseData = response.data['drinks'];

      if (responseData == null ||
          responseData is! List ||
          responseData.isEmpty) {
        return null;
      }
      // Берем первый элемент из списка
      return Cocktail.fromJson(responseData[0]);
    } catch (e) {
      return null;
    }
  }
}
