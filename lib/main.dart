import 'package:flutter/material.dart';

import 'theme/appTheme.dart';
import 'pages/homePage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //verificar se o app esta configurada para o modo dark antes de iniciar o app
  await ThemeController.loadTheme().whenComplete(() {
    runApp(StartApp());
  });

}

class StartApp extends StatelessWidget with ThemeController{

  @override
  Widget build(BuildContext context) {
    print('initialazed app');
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDarkMode,
      builder: (_context, bool _isDarkMode, _child) {
        return MaterialApp(
          title: 'Theme manager',
          //tema dinamico para o material e o cupertino
          theme: _context.themeData, //_isDarkMode ? AppTheme.darkMode : AppTheme.lightMode,
          home: const HomePage(),
        );
      }
    );
  }
}




