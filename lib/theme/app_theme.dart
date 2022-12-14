import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_dev_utils/dart_dev_utils.dart';

part './light_values.dart';
part './dark_values.dart';

/// Numa aplicação real, para ter uma instância do [SharedPreferences] sigleton 
/// disponivel para toda app será necessário usar um gerenciador de injeção de dependências 
late final SharedPreferences appConfigData;

/// Classe responsável por ler e definir o tema da app através do evento [addListener]
abstract class ThemeController {

  static final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);

  //verificar o modo dark está ativo
  static Future<void> loadTheme() async {

    appConfigData = await SharedPreferences.getInstance();

    if(appConfigData.containsKey('IsDarkMode')) {
      if(appConfigData.getBool('IsDarkMode')!) isDarkMode.value = true;
    } else {
      appConfigData.setBool('IsDarkMode', false);
    }

    isDarkMode.addListener(() {
      appConfigData.setBool('IsDarkMode', isDarkMode.value);
      printLog(
        'Setted dark Mode: ${isDarkMode.value}',
        name: 'app_Theme.dart > ThemeController > loadTheme'
      );
    });

  }

}

/// Injetar o tema da app dentro do context de toda árvores de widgets
extension ImplementThemeIntoContext on BuildContext {

  bool get isDarkMode => ThemeController.isDarkMode.value;

  set setDarkMode(bool value) => ThemeController.isDarkMode.value = value;

  ThemeData get theme => Theme.of(this);
  ThemeData get lightTheme => SetedTheme.lightMode;
  ThemeData get darkTheme => SetedTheme.darkMode;

}

/// Desse forma é possível acessar o tema de qualquer [Object] 
/// em toda app mesmo sem o context, basta apenas instânciar, herdar 
/// ou mixar esse objeto [AppTheme]
class AppTheme {

  bool get isDarkMode  => ThemeController.isDarkMode.value;

  set setDarkMode(bool value) => ThemeController.isDarkMode.value = value;

  ThemeData get theme => isDarkMode
    ? SetedTheme.darkMode 
    : SetedTheme.lightMode;
  
  ThemeData get lightTheme => SetedTheme.lightMode;
  
  ThemeData get darkTheme => SetedTheme.darkMode;

}

abstract class SetedTheme{

  static final ThemeData lightMode = _getThemeMode(LightValues.i);
  static final ThemeData darkMode = _getThemeMode(DarkValues.i);
  static ThemeData? _themeData;

  /// Definir o tema fazendo uma Cópia do tema [light] ou [dark] 
  /// e adicinar os valores de preferência para cada tema recebidos 
  /// das classes [LightValues] e [DarkValues] 
  static ThemeData _getThemeMode<T extends LightValues>(T value){
    
    _themeData = value is DarkValues 
      ? ThemeData.dark()
      : ThemeData.light();

    return ThemeData(

      appBarTheme: _themeData!.appBarTheme.copyWith(

        elevation: 0,        

        titleTextStyle: value.appBarTitleTextStyle,

        color: value.appBarColor, //cor de todas as appBars do projeto inteiro

        iconTheme: _themeData!.iconTheme.copyWith(//icon (leading)
          color: value.appBarIconColor,//cor dos icones leading nas appBars
          size: value.appBarIconSize,
        ),

        actionsIconTheme: _themeData!.iconTheme.copyWith(//icon actions (trailing)
          color: value.appBarActionsIconColor,//cor dos icones trailing nas appBars
          size:  value.appBarActionsIconSize,
        ),
      ),

      //https://m2.material.io/design/typography/the-type-system.html#type-scale
      textTheme: _themeData!.textTheme.copyWith(
        headline6: value.appBarTitleTextStyle,
      ),

      brightness: value is DarkValues ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: value.scaffoldBackgroundColor, //cor de para todas as Scaffolds do projeto (default is white)
      toggleableActiveColor: value.toggleableActiveColor,//cor dos widgets Switch, Radio, e Checkbox.
      //primarySwatch: value.primarySwatchColor,//cor primaria
      primaryColor: value.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,//ajustar a densidade dos pixels do acordo com o divice
      fontFamily: value.fontFamily,//estilo da font dos textos
      splashColor: value.splashColor,//cor do splash ao clicar nos botões

      /// Atribuindo os valores do tema para os widgets da lib [CupertinoApp]
      /// Qualquer widget da lib Cupertino dentro do MaterialApp também receberá 
      /// os valores do ThemeData do Material design
      /// 
      /// Isso possibilita usar os widgets da lib Cupertino dentro do Material
      /// sem se preocupar com o context do [MaterialApp] ou [CupertinoApp]
      ///
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: value is DarkValues ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: value.scaffoldBackgroundColor,
        primaryColor: value.primaryColor,
        barBackgroundColor: value.appBarColor, 
        textTheme: const CupertinoTextThemeData().copyWith(
          navTitleTextStyle: value.appBarTitleTextStyle,
        ),
      ),

    );
  }
}
