import 'dart:async';
import 'package:flutter/widgets.dart';

import '../main.dart' show starApp;
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({ Key? key }): super(key: key);
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with AppTheme{

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //após carregar o widget splash, execute
    WidgetsBinding.instance?.addPostFrameCallback((duration) {
      Future.delayed(
        const Duration(milliseconds: 2000),//aguardar 
        () => starApp = true
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: lightTheme.appBarTheme.backgroundColor,
      child: Image.asset(
        "assets/images/logo_144x144.png", 
        fit: BoxFit.fill,
      ),
    );
  }

}
