import 'package:flutter/material.dart';

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
              Navigator.pushReplacementNamed(context, '/');
//              Navigator.pushNamed(context, '/');
//              Navigator.popAndPushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Baralhos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/deck');
            },
          ),
          ListTile(
            title: Text('Card'),
            onTap: () {
              Navigator.pushNamed(context, '/card');
            },
          ),
        ],
      ),
    );
  }
}
