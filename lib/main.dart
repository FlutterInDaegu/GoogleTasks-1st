import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_tasks_1st/blocs/route_.dart';
import 'package:google_tasks_1st/blocs/routes.dart';
import 'package:google_tasks_1st/blocs/theme.dart';

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
      initialRoute: Routes.initialRoute,
      routes: Routes.getMaps,
    );
  }
}
