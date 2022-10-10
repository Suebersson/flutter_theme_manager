import 'package:flutter/material.dart';

/// classe responsável por todos os valores do tema light da app.
/// A partir dessa classe, a classe responsável pelo tema dark receberá as cores
/// que define o tema e támbem fará uma cópia dos styles atribuidos aqui 
class LightValues {

  static LightValues? _instance;

  static var GoogleFonts;

  LightValues._();

  static LightValues get i {
    _instance ??= LightValues._();
    return _instance!;
  }

  final Color appBarColor = Colors.red;
  final Color appBarIconColor = Colors.white;
  final double appBarIconSize = 26.0;
  final Color appBarActionsIconColor = Colors.white;
  final double appBarActionsIconSize = 26.0;
  final Color toggleableActiveColor = Colors.blueGrey;
  final Color scaffoldBackgroundColor = Colors.white; 
  final Color primaryColor = Colors.grey;
  final TextStyle appBarTitleTextStyle = const TextStyle(
    color: Colors.white, 
    fontSize: 22, 
    fontWeight: FontWeight.w600
  );
  final String fontFamily = "monospace"; //"Georgia";
  final Color splashColor = Colors.cyan;

}


//DefaultTextStyle.of(context).style.fontFamily; //lê a font padrão do app
//https://fonts.google.com/
//https://material.io/design/typography/the-type-system.html#applying-the-type-scale
//https://pub.dev/packages/google_fonts

