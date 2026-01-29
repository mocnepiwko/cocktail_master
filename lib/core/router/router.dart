import 'package:cocktail_master/data/models/cocktail.dart';
import 'package:cocktail_master/features/add_cocktail/add_cocktail_screen.dart';
import 'package:cocktail_master/features/details/cocktail_details_screen.dart';
import 'package:cocktail_master/features/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Вложенный маршрут для деталей
          GoRoute(
            path: 'details',
            name: 'details',
            builder: (context, state) {
              // Мы передаем объект коктейля при переходе
              final cocktail = state.extra as Cocktail;
              return CocktailDetailsScreen(cocktail: cocktail);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/add',
        name: 'add',
        builder: (context, state) => const AddCocktailScreen(),
      ),
    ],
  );
}
