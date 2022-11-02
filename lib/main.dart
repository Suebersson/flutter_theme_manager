import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'pages/home_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //verificar se o app esta configurada para o modo dark antes de iniciar o app
  await ThemeController.loadTheme().whenComplete(() {
    runApp(const StartApp());
  });

}


class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('initialazed app');
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDarkMode,
      builder: (_context, _isDarkMode, _child) {
        return MaterialApp(
          title: 'Theme manager',
          //tema dinamico para o material ou cupertino
          theme: _isDarkMode ? AppTheme.darkMode : AppTheme.lightMode,
          home: const HomePage(),
        );
      }
    );
  }
}
