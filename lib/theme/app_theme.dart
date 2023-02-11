import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_dev_utils/dart_dev_utils.dart';

part './themes.dart';
part './light_values.dart';
part './dark_values.dart';

/// Numa aplicação real, para ter uma instância de [SharedPreferences] sigleton 
/// disponivel para toda app será necessário usar um gerenciador de injeção de dependências 
late final SharedPreferences appConfigData;

/// Classe responsável por ler e definir o tema da app através do evento [addListener]
abstract class AppTheme {

  static final ValueNotifier<bool> isDarkModeState = ValueNotifier<bool>(false);

  //verificar o modo dark está ativo
  static Future<void> loadTheme() async {

    appConfigData = await SharedPreferences.getInstance();

    if(appConfigData.containsKey('isDarkMode')) {
      if(appConfigData.getBool('isDarkMode')!) isDarkModeState.value = true;
    } else {
      appConfigData.setBool('isDarkMode', false);
    }

    isDarkModeState.addListener(() {
      appConfigData.setBool('isDarkMode', isDarkModeState.value);
      printLog(
        'Dark theme: ${isDarkModeState.value}',
        name: 'AppTheme'
      );
    });

  }

  bool get isDarkMode => isDarkModeState.value;

  set setDarkMode(bool value) => isDarkModeState.value = value;

  ThemeData get theme => isDarkMode ? _Themes.darkMode : _Themes.lightMode;
  ThemeData get lightTheme => _Themes.lightMode;
  ThemeData get darkTheme => _Themes.darkMode;

}

/// Injetar o tema da app dentro do context de toda árvores de widgets
extension InjectTheme on BuildContext {

  bool get isDarkMode => AppTheme.isDarkModeState.value;

  set setDarkMode(bool value) => AppTheme.isDarkModeState.value = value;

  ThemeData get theme => Theme.of(this);
  ThemeData get lightTheme => _Themes.lightMode;
  ThemeData get darkTheme => _Themes.darkMode;

}
