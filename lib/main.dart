import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dart_dev_utils/dart_dev_utils.dart';

import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen.dart';

bool starApp = false;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  /// Exibir a Splash screen enquantos as dependências são carregadas
  /// e carregar a app depois que as dependências forem carregadas
  /// 
  /// Dessa forma a app será carregada apenas após a execução assíncrona da
  /// Splash e das dependências
  /// 
  /// Resumidamente, o processo de execução do carregamento das dependências aproveita
  /// o tempo de exibição da Splash screen e caso o tempo de exibição da splash seja
  /// maior do que o tempo de carregamento das dependências, a app será carregada depois
  /// do carregamento de todas as dependências. Isso melhora a experiência do usuário 
  /// no uso da app transmitindo a sensação que a app foi iniciada enquanto as depenências
  /// são carregadas por baixo dos panos
  runApp(const SplashScreen());

  /// executar/carregar multiplos procedimento que serão executados aos mesmo tempo(assíncrono), 
  /// depois que completar as execuções a app será iniciada
  await Future.wait([
    ThemeController.loadTheme(),
    // injeção de dependencias gerais,
    // appConfigData,
    
  ]).whenComplete(() {
    Timer.periodic(const Duration(milliseconds: 200), (timer){
      if(starApp){
        timer.cancel();
        runApp(const StartApp());
      }
    });
  });

}


class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // debugPrint('initialazed app');

    printLog(
      'initialazed app',
      name: 'Theme manger'
    );

    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDarkMode,
      builder: (_context, _isDarkMode, _child) {
        return MaterialApp(
          title: 'Theme manager',
          //tema dinamico para o material ou cupertino
          theme: _isDarkMode ? SetedTheme.darkMode : SetedTheme.lightMode,
          home: const HomePage(),
        );
      }
    );
  }
}
