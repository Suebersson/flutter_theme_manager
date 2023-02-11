import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class HomePage extends StatelessWidget with AppTheme {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.isDarkMode //AppTheme.isDarkMode.value
            ? 'App no modo dark'
            : 'App no modo light'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add, 
              //color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              //size: Theme.of(context).appBarTheme.actionsIconTheme?.size,
              //color: context.theme.appBarTheme.actionsIconTheme?.color,
              //size: context.theme.appBarTheme.actionsIconTheme?.size,
              color: theme.appBarTheme.actionsIconTheme?.color,
              size: theme.appBarTheme.actionsIconTheme?.size,
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
                    color: context.isDarkMode //AppTheme.isDarkMode.value
                      ? Theme.of(context).appBarTheme.titleTextStyle!.color
                      : Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                Switch(
                  //formas de atribuir um valor do ThemeData a uma propriedade 
                  //activeColor: Theme.of(context).toggleableActiveColor,
                  //activeColor: context.theme.toggleableActiveColor,
                  activeColor: theme.toggleableActiveColor,
                  // value: context.isDarkMode,
                  value: isDarkMode,
                  onChanged: (bool value){// definir o tema da app
                    // AppTheme.isDarkModeState.value = value;
                    // Definindo pelo context
                    // context.setDarkMode = value;
                    // de qualquer objeto, até fora da árvore de widgets
                    setDarkMode = value;
                  },
                ),
              ],
            ),
          ),

          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const FlutterLogo(size: 300), 
          ),
         
        ],
      ),
    );
  }
}

