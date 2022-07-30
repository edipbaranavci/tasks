import 'package:flutter/material.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/utils/shared_manager.dart';

class ThemeSettings with ChangeNotifier {
  ThemeSettings() {
    _getThemeSettings();
  }
  final _allColors = ColorConstants().allColor;
  final _sharedManager = SharedManager();
  bool _isDark = false;
  int _colorIndex = 0;

  bool get getIsDarkMode => _isDark;
  int get getColorIndex => _colorIndex;
  ThemeMode get getThemeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
  ThemeData get getDarkThemeData => ThemeData.dark().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white70,
            backgroundColor: Colors.black,
          ),
        ),
      );
  ThemeData get getThemeData => ThemeData(
        primarySwatch: _allColors[_colorIndex] as MaterialColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: _colorIndex == 0 ? Colors.black : Colors.white,
            backgroundColor: _allColors[_colorIndex],
          ),
        ),
        brightness: Brightness.light,
        listTileTheme: ListTileThemeData(
          iconColor: _colorIndex == 0 ? Colors.black : Colors.white,
          textColor: _colorIndex == 0 ? Colors.black : Colors.white,
        ),
      );

  Future<void> _getThemeSettings() async {
    _colorIndex = await _sharedManager.getColorIndex();
    _isDark = await _sharedManager.getIsDarkMode();
    notifyListeners();
  }

  void setThemeData(int newColorIndex) {
    _colorIndex = newColorIndex;
    _isDark = false;
    writeThemeDatas();
    notifyListeners();
  }

  void setThemeMode() {
    _isDark = !_isDark;
    writeThemeDatas();
    notifyListeners();
  }

  void writeThemeDatas() {
    _sharedManager.writeDatas(isDarkMode: _isDark, colorIndex: _colorIndex);
  }
}
