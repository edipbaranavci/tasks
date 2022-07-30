import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  final String _colorIndexKey = 'colorIndex';
  final String _isDarkModeKey = 'isDarkMode';

  Future<void> writeDatas({
    required bool isDarkMode,
    required int colorIndex,
  }) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(_colorIndexKey, colorIndex);
    pref.setBool(_isDarkModeKey, isDarkMode);
  }

  Future<int> getColorIndex() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(_colorIndexKey) ?? 0;
  }

  Future<bool> getIsDarkMode() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_isDarkModeKey) ?? false;
  }
}
