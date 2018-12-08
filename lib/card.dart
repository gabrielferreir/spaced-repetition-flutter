import 'package:flutter/material.dart';
import './components/drawer.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
//      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Card 0001'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
//        color: Colors.purple,
        child: Container(
//          color: Colors.green,
          margin: EdgeInsets.all(16.0),
          constraints: BoxConstraints.expand(),
          child: Card(
            elevation: 8.0,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                    child: Text('Titulo', style: TextStyle(fontSize: 32.0)),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and ' +
                        'typesetting industry. Lorem Ipsum has been the industry' +
                        's standard dummy text ever since the 1500s, when an' +
                        'unknown printer took a galley of type and scrambled it' +
                        'to make a type specimen book.',
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),)
            ),
          ),
        ),
      ),
    );
  }
}

//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Card(
//child: InkWell(
//onTap: () {},
//child: Container(
//width: width * 0.8,
//height: height * 0.8,
//padding: EdgeInsets.all(16.0),
//child: Column(
//children: <Widget>[
//Padding(
//padding: EdgeInsets.symmetric(
//horizontal: 0.0, vertical: 8.0),
//child: Text('Titulo', style: TextStyle(fontSize: 32.0)),
//),
//Text(
//'Lorem Ipsum is simply dummy text of the printing and ' +
//'typesetting industry. Lorem Ipsum has been the industry' +
//'s standard dummy text ever since the 1500s, when an' +
//'unknown printer took a galley of type and scrambled it' +
//'to make a type specimen book.',
//style: TextStyle(fontSize: 16.0),
//)
//],
//),
//),
//))
//],
//)
//],
//),
