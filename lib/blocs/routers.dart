import 'package:flutter/cupertino.dart';
import 'package:Google_tasks_1st/screens/home.dart';
import 'package:Google_tasks_1st/screens/intro.dart';

class Routers {
  static const initialRoute = '/';
  static const String home = '/home';
  static const String intro = '/intro';

  static Map<String, WidgetBuilder> getMaps = <String, WidgetBuilder>{
    home: (_) => Home(),
    intro: (_) => Intro(),
  };
}