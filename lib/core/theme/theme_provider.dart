import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  bool build() {
    return false; // По умолчанию светлая (false)
  }

  void toggle() {
    state = !state; // Переключает: было светло -> стало темно
  }
}
