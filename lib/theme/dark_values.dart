part of './app_theme.dart';

/// Definifir as cores para o tema dark.
/// Nesse classe devemos fazer apenas as alterações necessárias que define o tema dark
/// o restante dos atributos podem ser definidos através da classe [LightValues] 
class _DarkValues implements _LightValues{

  static final _DarkValues _instance = _DarkValues._();
  static _DarkValues get i =>_instance;
  _DarkValues._();

  @override
  double get appBarIconSize => _LightValues.i.appBarIconSize;
  @override
  double get appBarActionsIconSize => _LightValues.i.appBarActionsIconSize;
  @override
  Color get appBarColor => const Color.fromARGB(95, 204, 13, 13);
  @override
  Color get appBarIconColor => Colors.white60;
  @override
  Color get appBarActionsIconColor => Colors.white60;
  @override
  Color get toggleableActiveColor => const Color.fromARGB(255, 117, 189, 120);
  @override
  Color get scaffoldBackgroundColor => const Color.fromARGB(255, 39, 38, 38);
  @override
  Color get primaryColor => Colors.blueGrey;
  @override
  Color get splashColor => Colors.white60;
  @override
  String get fontFamily => _LightValues.i.fontFamily;
  @override
  TextStyle get appBarTitleTextStyle => _LightValues.i.appBarTitleTextStyle.copyWith(
    color: Colors.white60, 
  );

}
