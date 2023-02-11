import 'dart:async';
import 'package:flutter/widgets.dart';

import '../main.dart' show starApp;

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({ Key? key }): super(key: key);
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
      color: const Color(0xFFF44336),
      child: Image.asset(
        "assets/images/logo_144x144.png", 
        fit: BoxFit.fill,
      ),
    );
  }

}
