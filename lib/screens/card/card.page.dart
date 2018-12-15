import 'package:flutter/material.dart';
import './card.state.dart';
import '../../widgets/flip.widget.dart';
import '../../widgets/dragging.widget.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Card 0001'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Container(
          margin: EdgeInsets.all(16.0),
          constraints: BoxConstraints.expand(),
          child: Stack(children: list),
        ),
      ),
    );
  }

  @override
  void initState() {
    this.list = gerateList();
  }

  void callback(Key key) {
    for (var i = 0; i < list.length; i++) {
      if (list[i].key == key) {
        setState(() {
          list.removeAt(i);
          list = List.from(list);
        });
      }
    }
  }

  List<Widget> gerateList() {
    List<Widget> list = [];
    for (var i = 0; i < 2; i++) {
      list.add(
        Dragging(
          child: Flip(
              front: Front(
                title: 'Card $i',
              ),
              back: Back(
                title: 'Back $i',
              )),
          callback: this.callback,
          key: Key("card$i"),
        ),
      );
    }
    return list;
  }
}
