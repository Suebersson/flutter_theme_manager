import 'package:flutter/material.dart';

import '../theme/appTheme.dart';

class HomePage extends StatelessWidget with ThemeController {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.isDarkMode //ThemeController.isDarkMode.value
            ? 'App no modo dark'
            : 'App no modo light'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add, 
              color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              size: Theme.of(context).appBarTheme.actionsIconTheme?.size,
            ),
            padding: const EdgeInsets.only(right: 15),
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Modo escuro", 
                  style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: context.isDarkMode //ThemeController.isDarkMode.value
                      ? Theme.of(context).appBarTheme.titleTextStyle!.color
                      : Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                Switch(
                  //formas de atribuir um valor do ThemeData a uma propriedade 
                  //activeColor: ThemeData.light().toggleableActiveColor,
                  //activeColor: Theme.of(context).toggleableActiveColor,
                  //activeColor: context.themeData.toggleableActiveColor,
                  value: context.isDarkMode,
                  onChanged: (bool value){// definir o tema da app
                    //ThemeController.isDarkMode.value = value;
                    // Definindo pelo context
                    context.setDarkMode = value;
                  },
                ),
              ],
            ),
          ),

          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: FlutterLogo(size: 300), 
          ),
         
        ],
      ),
    );
  }
}

