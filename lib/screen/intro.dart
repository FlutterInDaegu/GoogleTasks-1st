import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Image
              Expanded(
                child: Image.asset('images/intro.png'),
              ),

              /// Contents
              _Contents(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Contents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// Texts
          Text(
            'Tasks에 오신 것을 환영합니다',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),

          /// Blank
          SizedBox(height: 8.0),

          Text(
            '중요한 할 일을 한곳에서 관리해 보세요.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),

          /// Blank
          SizedBox(height: 16.0),

          /// Button
          FlatButton(
            onPressed: () {},
            color: Colors.blue,
            child: Text(
              '시작하기',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
