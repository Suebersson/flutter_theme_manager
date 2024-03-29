import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dart_dev_utils/dart_dev_utils.dart';

import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen.dart';

bool starApp = false;

void main() async{
  
  /// Executar procedimentos antes ou depois da app iniciar
  WidgetsFlutterBinding.ensureInitialized();

  /// Exibir a Splash screen enquantos as dependências são carregadas
  /// e recarregar a app depois que as dependências forem carregadas
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
  await Future.wait(
    [
      AppTheme.loadTheme(),
      // injeção de dependencias gerais,
      // appConfigData,
      // ...
    ],
    eagerError: true // se ocorrer algum erro na execução da funções, exiba imediatamente
  ).then((_) {
    Timer.periodic(const Duration(milliseconds: 200), (timer){
      if(starApp) {
        timer.cancel();
        runApp(const StartApp());
      }
    });
  }).catchError((error){
    printLog(
      'Error ao executar as funções de iniciação da app',
      name: 'main'
    );
  });

}

class StartApp extends StatelessWidget with AppTheme{
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('initialazed app');
    printLog(
      'initialazed app',
      name: 'StartApp'
    );

    return ValueListenableBuilder<bool>(
      valueListenable: AppTheme.isDarkModeState,
      builder: (_, _isDarkMode, __) {
        return MaterialApp(
          title: 'Theme manager',
          //tema dinamico para o material ou cupertino
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const HomePage(),
        );
      }
    );
  }
}
