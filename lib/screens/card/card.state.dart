import 'package:flutter/material.dart';
import '../../widgets/flip.widget.dart';

List<Widget> gerateList() {
  List<Widget> list = [];
  for (var i = 0; i < 3; i++) {
    list.add(Flip(front: Front(), back: Back()));
  }
  return list;
}

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {},
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
          )),
      constraints: BoxConstraints.expand(),
    );
  }
}

class Front extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {},
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
          )),
      constraints: BoxConstraints.expand(),
    );
  }
}
