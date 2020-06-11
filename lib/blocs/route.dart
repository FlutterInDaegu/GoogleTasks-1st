import 'package:flutter/material.dart';
import 'package:googletask/blocs/theme.dart';
import 'package:googletask/screens/home.dart';
import 'package:googletask/screens/intro.dart';
import 'package:provider/provider.dart';

class route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter in Daegu - clone coding',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Intro(),
        '/home': (context) => Home(),
      },
    );
  }
}
