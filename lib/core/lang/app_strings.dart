import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_strings.g.dart';

// Перечисление доступных языков
enum AppLanguage { ru, en, pl }

// Провайдер теперь хранит не bool, а AppLanguage
@riverpod
class LanguageNotifier extends _$LanguageNotifier {
  @override
  AppLanguage build() => AppLanguage.ru; // По умолчанию Русский

  // Переключаем по кругу: RU -> EN -> PL -> RU
  void toggle() {
    switch (state) {
      case AppLanguage.ru:
        state = AppLanguage.en;
        break;
      case AppLanguage.en:
        state = AppLanguage.pl;
        break;
      case AppLanguage.pl:
        state = AppLanguage.ru;
        break;
    }
  }
}

class AppStrings {
  final AppLanguage language;

  AppStrings(this.language);

  String get(String key) {
    switch (language) {
      case AppLanguage.ru:
        return _ru[key] ?? key;
      case AppLanguage.en:
        return _en[key] ?? key;
      case AppLanguage.pl:
        return _pl[key] ?? key;
    }
  }

  // --- 🇷🇺 РУССКИЙ ---
  static const Map<String, String> _ru = {
    'title': 'Коктейль Мастер 🍸',
    'search_hint': 'Поиск (например: Mojito)',
    'my_collection': '❤️ Моя коллекция',
    'empty_fav': 'Пусто. Добавьте коктейль!',
    'ingredients': 'Ингредиенты:',
    'recipe': 'Рецепт:',
    'photo_web': 'Из интернета',
    'photo_local': 'Свое фото',
    'new_cocktail': 'Новый коктейль',
    'name_label': 'Название коктейля',
    'name_error': 'Введите название',
    'recipe_label': 'Рецепт / Инструкция',
    'date_label': 'Дата создания',
    'add_photo': 'Добавить фото',
    'change_photo': 'Изменить фото',
    'save_btn': 'СОХРАНИТЬ В БАЗУ',
    'saved_success': '✅ Коктейль сохранен!',
    'fav_added': '❤️ Добавлено в избранное!',
    'fav_removed': '💔 Удалено из избранного',
    'custom_btn': 'Свой рецепт',
    'lang_name': 'RU',
    'share': 'Поделиться',
    'share_text': 'Смотри какой коктейль: ',
  };

  // --- 🇬🇧 ENGLISH ---
  static const Map<String, String> _en = {
    'title': 'Cocktail Master 🍸',
    'search_hint': 'Search (e.g. Mojito)',
    'my_collection': '❤️ My Collection',
    'empty_fav': 'Empty. Add some cocktails!',
    'ingredients': 'Ingredients:',
    'recipe': 'Instructions:',
    'photo_web': 'From Web',
    'photo_local': 'Local Photo',
    'new_cocktail': 'New Cocktail',
    'name_label': 'Cocktail Name',
    'name_error': 'Enter name',
    'recipe_label': 'Recipe / Instructions',
    'date_label': 'Creation Date',
    'add_photo': 'Add Photo',
    'change_photo': 'Change Photo',
    'save_btn': 'SAVE TO DB',
    'saved_success': '✅ Cocktail saved!',
    'fav_added': '❤️ Added to favorites!',
    'fav_removed': '💔 Removed from favorites',
    'custom_btn': 'My Recipe',
    'lang_name': 'EN',
    'share': 'Share',
    'share_text': 'Check out this cocktail: ',
  };

  // --- 🇵🇱 POLSKI ---
  static const Map<String, String> _pl = {
    'title': 'Mistrz Koktajli 🍸',
    'search_hint': 'Szukaj (np. Mojito)',
    'my_collection': '❤️ Moja kolekcja',
    'empty_fav': 'Pusto. Dodaj koktajl!',
    'ingredients': 'Składniki:',
    'recipe': 'Przepis:',
    'photo_web': 'Z internetu',
    'photo_local': 'Własne zdjęcie',
    'new_cocktail': 'Nowy koktajl',
    'name_label': 'Nazwa koktajlu',
    'name_error': 'Wpisz nazwę',
    'recipe_label': 'Przepis / Instrukcja',
    'date_label': 'Data utworzenia',
    'add_photo': 'Dodaj zdjęcie',
    'change_photo': 'Zmień zdjęcie',
    'save_btn': 'ZAPISZ W BAZIE',
    'saved_success': '✅ Zapisano!',
    'fav_added': '❤️ Dodano do ulubionych!',
    'fav_removed': '💔 Usunięto z ulubionych',
    'custom_btn': 'Własny przepis',
    'lang_name': 'PL',
    'share': 'Udostępnij',
    'share_text': 'Zobacz ten koktajl: ',
  };
}
