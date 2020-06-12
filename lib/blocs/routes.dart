import 'package:flutter/cupertino.dart';
import 'package:google_tasks_1st/screens/home.dart';
import 'package:google_tasks_1st/screens/intro.dart';

class Routes {
  static const initialRoute = '/';
  static const String home = '/home';
  static const String intro = '/intro';

  static Map<String, WidgetBuilder> getMaps = <String, WidgetBuilder>{
    home: (_) => Home(),
    intro: (_) => Intro(),
  };
}