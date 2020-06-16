import 'package:Google_tasks_1st/blocs/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
//          doc.reference.updateData({'age': doc['age'] + 1});
          Firestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap = await transaction.get(doc.reference);
            await transaction.update(freshSnap.reference, {
              'age': freshSnap['age'] + 1,
            });
            print('트렌젝선을 이용한 +1');
          });
        },
        title: Row(
          children: <Widget>[
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
      );
    }

    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                '내 할 일 목록',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              flex: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        itemBuilder: (context, index) => _buildListItem(
                            context, snapshot.data.documents[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
