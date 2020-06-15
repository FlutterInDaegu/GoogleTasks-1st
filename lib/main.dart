import 'package:Google_tasks_1st/blocs/routers.dart';
import 'package:Google_tasks_1st/blocs/theme.dart';
import 'package:Google_tasks_1st/screens/home.dart';
import 'package:Google_tasks_1st/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (context) => ThemeChanger(ThemeData.light()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter in Daegu - clone coding',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      initialRoute: Routers.initialRoute,
//      routes: Routers.getMaps,
      routes: {
        '/': (_) => Intro(),
        '/home': (_) => Home(),
      },
    );
  }
}
