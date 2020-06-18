import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listBuilder extends StatefulWidget {
  @override
  _listBuilderState createState() => _listBuilderState();
}
Widget _buildListItem(BuildContext context, DocumentSnapshot doc) {
  return ListTile(
    onTap: () async {
      await countUp(doc);
      //onTap: () {
      //doc.reference.updateData({'age': doc['age'] + 1});
    },
    onLongPress: () {
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
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                doc['age'].toString(),
                style: Theme.of(context).textTheme.headline6,
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

class _listBuilderState extends State<listBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('main').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Expanded(
              flex: 1,
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
          return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              //itemExtent: 100.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            ),
          );
        },
      ),
  }
}


