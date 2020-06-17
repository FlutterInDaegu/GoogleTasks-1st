import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            height: 100,
            width: 100,
            //margin: EdgeInsets.all(20),
            //margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            //margin: EdgeInsets.fromLTRB(10, 50, 20, 40),
            margin: EdgeInsets.only(left: 50),
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            child: Text(
              '가나다라마바사',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
