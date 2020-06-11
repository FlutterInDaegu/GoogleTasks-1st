import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  Intro({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    //print('다크모드 인가? $darkModeOn');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/task_intro.jpg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Tasks에 온것을 환영합니다.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              '중요한 할 일을 한곳에서 관리하세요',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            RaisedButton(
              child: Text(
                '시작하기',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                print('시작하기 클릭');
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
