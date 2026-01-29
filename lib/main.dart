import 'package:cocktail_master/core/router/router.dart';
import 'package:cocktail_master/core/theme/theme.dart';
import 'package:cocktail_master/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: CocktailApp()));
}

class CocktailApp extends ConsumerWidget {
  const CocktailApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    // Следим за состоянием темы
    final isDarkMode = ref.watch(themeModeNotifierProvider);

    return MaterialApp.router(
      title: 'Cocktail Master',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // Тут магия: если isDarkMode == true, включаем темную, иначе светлую
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
