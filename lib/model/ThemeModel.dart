import 'package:flutter/cupertino.dart';
import '../components/theme_shared_preferences.dart';


class ThemeModel extends ChangeNotifier{
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;
  bool get isdark => _isDark;

  ThemeModel(){
    _isDark = false;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }

  set isDark(bool value){
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async{
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }

}