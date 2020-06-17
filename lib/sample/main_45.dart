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
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            //verticalDirection: VerticalDirection.down,

            //mainAxisAlignment 화면 전체 기준으로 container 배열 조정
            //mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,

            //crossAxisAlignment 컨테이너들을 위치 조정 혹은 사이즈 조정(start, end, stretch)
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                //height: 100,
                width: 100,
                color: Colors.white,
                child: Text('컨테이너 1'),
              ),
              SizedBox(width: 10.0),
              Container(
                width: 100,
                //height: 100,
                color: Colors.blue,
                child: Text('컨테이너 2'),
              ),
              Container(
                width: 100,
                //height: 100,
                color: Colors.red,
                child: Text('컨테이너 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
