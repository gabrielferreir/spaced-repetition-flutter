import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  String title;

  Back({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: Text('BACK', style: TextStyle(fontSize: 32.0)),
            ),
            Text(
              this.title,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}

class Front extends StatelessWidget {
  String title;

  Front({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: Text('FRONT', style: TextStyle(fontSize: 32.0)),
            ),
            Text(
              this.title,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}
