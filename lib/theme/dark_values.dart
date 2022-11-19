part of './app_theme.dart';

/// Definifir as cores para o tema dark.
/// Nesse classe devemos fazer apenas as alterações necessárias que define o tema dark
/// o restante dos atributos podem ser definidos através da classe [LightValues] 
class DarkValues implements LightValues{

  static final DarkValues _instance = DarkValues._();
  static DarkValues get i =>_instance;
  DarkValues._();

  @override
  double get appBarIconSize => LightValues.i.appBarIconSize;
  @override
  double get appBarActionsIconSize => LightValues.i.appBarActionsIconSize;
  @override
  Color get appBarColor => const Color.fromARGB(95, 204, 13, 13);
  @override
  Color get appBarIconColor => Colors.white60;
  @override
  Color get appBarActionsIconColor => Colors.white60;
  @override
  Color get toggleableActiveColor => const Color.fromARGB(255, 117, 189, 120);
  @override
  Color get scaffoldBackgroundColor => const Color.fromARGB(57, 155, 154, 154);
  @override
  Color get primaryColor => Colors.blueGrey;
  @override
  Color get splashColor => Colors.white60;
  @override
  String get fontFamily => LightValues.i.fontFamily;
  @override
  TextStyle get appBarTitleTextStyle => LightValues.i.appBarTitleTextStyle.copyWith(
    color: Colors.white60, 
  );

}
