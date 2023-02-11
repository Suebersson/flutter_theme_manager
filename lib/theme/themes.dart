part of './app_theme.dart';

abstract class _Themes{

  static final ThemeData lightMode = createTheme(_LightValues.i);
  static final ThemeData darkMode = createTheme(_DarkValues.i);
  static late ThemeData themeData;

  /// Criar o tema fazendo uma cópia do tema [ThemeData.light] ou [ThemeData.dark] 
  /// e adicinar os valores de preferência para cada tema recebidos 
  /// das classes [_LightValues] e [_DarkValues] 
  static ThemeData createTheme<T extends _LightValues>(T values){
    
    themeData = values is _DarkValues 
      ? ThemeData.dark()
      : ThemeData.light();

    return ThemeData(

      appBarTheme: themeData.appBarTheme.copyWith(

        elevation: 0,        

        titleTextStyle: values.appBarTitleTextStyle,
        
        backgroundColor: values.appBarColor, //cor de todas as appBars do projeto inteiro

        iconTheme: themeData.iconTheme.copyWith(//icon (leading)
          color: values.appBarIconColor,//cor dos icones leading nas appBars
          size: values.appBarIconSize,
        ),

        actionsIconTheme: themeData.iconTheme.copyWith(//icon actions (trailing)
          color: values.appBarActionsIconColor,//cor dos icones trailing nas appBars
          size:  values.appBarActionsIconSize,
        ),
      ),

      //https://m2.material.io/design/typography/the-type-system.html#type-scale
      textTheme: themeData.textTheme.copyWith(
        headline6: values.appBarTitleTextStyle,
      ),

      brightness: values is _DarkValues ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: values.scaffoldBackgroundColor, //cor de para todas as Scaffolds do projeto (default is white)
      toggleableActiveColor: values.toggleableActiveColor,//cor dos widgets Switch, Radio, e Checkbox.
      //primarySwatch: values.primarySwatchColor,//cor primaria
      primaryColor: values.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,//ajustar a densidade dos pixels do acordo com o divice
      fontFamily: values.fontFamily,//estilo da font dos textos
      splashColor: values.splashColor,//cor do splash ao clicar nos botões

      /// Atribuindo os valores do tema para os widgets da lib [CupertinoApp]
      /// Qualquer widget da lib Cupertino dentro do MaterialApp também receberá 
      /// os valores do ThemeData do Material design
      /// 
      /// Isso possibilita usar os widgets da lib Cupertino dentro do Material
      /// sem se preocupar com o context do [MaterialApp] ou [CupertinoApp]
      ///
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: values is _DarkValues ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: values.scaffoldBackgroundColor,
        primaryColor: values.primaryColor,
        barBackgroundColor: values.appBarColor, 
        textTheme: const CupertinoTextThemeData().copyWith(
          navTitleTextStyle: values.appBarTitleTextStyle,
        ),
      ),

    );
  }
}
