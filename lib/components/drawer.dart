import 'package:flutter/material.dart';
import '../router/slide_router_right.dart';
import '../home.dart';
import '../deck.dart';
import '../card.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text('TG')],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
//              Navigator.pushReplacementNamed(context, '/');
              Navigator.pushReplacement(context, SlideRouterRight(widget: HomePage()));
//              Navigator.pushNamed(context, '/');
//              Navigator.popAndPushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Baralhos'),
            onTap: () {
//              Navigator.pushReplacementNamed(context, '/deck');
              Navigator.pushReplacement(context, SlideRouterRight(widget: DeckPage()));
            },
          ),
          ListTile(
            title: Text('Card'),
            onTap: () {
//              Navigator.pushNamed(context, '/card');
              Navigator.push(context, SlideRouterRight(widget: CardPage()));
            },
          ),
        ],
      ),
    );
  }
}
