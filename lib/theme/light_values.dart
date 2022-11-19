part of './app_theme.dart';

/// classe responsável por todos os valores do tema light da app.
/// A partir dessa classe, a classe responsável pelo tema dark receberá as cores
/// que define o tema e támbem fará uma cópia dos styles atribuidos aqui 
class LightValues {

  static final LightValues _instance = LightValues._();
  static LightValues get i =>_instance;
  LightValues._();

  final double appBarIconSize = 26.0;
  final double appBarActionsIconSize = 26.0;
  final Color appBarColor = const Color(0xFFF44336); /// [Colors.red];
  final Color appBarIconColor = Colors.white;
  final Color appBarActionsIconColor = Colors.white;
  final Color toggleableActiveColor = Colors.blueGrey;
  final Color scaffoldBackgroundColor = Colors.white; 
  final Color primaryColor = Colors.grey;
  final Color splashColor = Colors.cyan;
  final String fontFamily = "Dancing Script";
  final TextStyle appBarTitleTextStyle = const TextStyle(
    color: Colors.white, 
    fontSize: 22, 
    fontWeight: FontWeight.bold,
    fontFamily: "Dancing Script",
  );

}


//DefaultTextStyle.of(context).style.fontFamily; //lê a font padrão do app
//https://fonts.google.com/
//https://material.io/design/typography/the-type-system.html#applying-the-type-scale
//https://pub.dev/packages/google_fonts

