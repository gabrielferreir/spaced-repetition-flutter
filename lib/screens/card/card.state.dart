import 'package:flutter/material.dart';

class Back extends StatelessWidget {
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
              'BACK',
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
              'FRONT 2',
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}
