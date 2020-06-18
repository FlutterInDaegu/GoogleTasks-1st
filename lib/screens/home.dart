import 'package:Google_tasks_1st/blocs/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    Widget _buildListItem(BuildContext context, DocumentSnapshot doc) {
      return ListTile(
        onTap: () {
          doc.reference.updateData({'age': doc['age'] + 1});
        },
//        onTap: () async {
//          //await countUp(doc);
//        },
        onLongPress: () {
          print('롱탭');
          _showMyDialog(doc);
        },
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: FlatButton(
                    onPressed: () {
                      print('완료');
                    },
                    child: Icon(
                      Icons.radio_button_unchecked,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    doc['name'],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    doc['age'].toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2,
              child: Container(color: Colors.grey),
            )
          ],
        ),
      );
    }

    return new Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80.0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '내 할 일 목록',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection('main').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Expanded(
                    flex: 0,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/first_empty.jpg',
                          fit: BoxFit.contain,
                        ),
                        Text(
                          '새로 시작',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '할 일을 추가 하시겠습니까?',
                        ),
                      ],
                    ),
                  );
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //itemExtent: 80.0,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Icon(
                    Icons.playlist_add,
                  ),
                  onPressed: () {
                    print('라이트모드');
                    _themeChanger.setTheme(ThemeData.light());
                  },
                ),
                RaisedButton(
                  child: Icon(
                    Icons.control_point,
                  ),
                  onPressed: () {
                    print('메모 추가하기');
                    //text 입력 위젯이 나타나게 하기
//                    doc.reference
//                        .collection('main')
//                        .document('1')
//                        .setData({'age': 44, 'name': '권영각'});
                  },
                ),
                RaisedButton(
                  child: Icon(
                    Icons.receipt,
                  ),
                  onPressed: () {
                    print('다크모드');
                    _themeChanger.setTheme(ThemeData.dark());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future countUp(DocumentSnapshot doc) async {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(doc.reference);
      await transaction.update(freshSnap.reference, {
        'age': freshSnap['age'] + 1,
      });
    });
  }

  Future<void> _showMyDialog(DocumentSnapshot doc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 하시겠습니까?'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                print('삭제 하기');
                doc.reference.delete();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
