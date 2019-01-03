import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import 'package:tg/ui/pages/home/home.page.dart';
import 'package:tg/ui/pages/deck/deck.page.dart';
import 'package:tg/ui/pages/login/login.page.dart';

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
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context, SlideRouterRight(widget: HomePage()));
            },
          ),
          ListTile(
            title: Text('Baralhos'),
            onTap: () {
              Navigator.pushReplacement(
                  context, SlideRouterRight(widget: DeckPage()));
            },
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () async {
              final _storage = new FlutterSecureStorage();
              await _storage.delete(key: 'token');
              Navigator.pushReplacement(
                  context, SlideRouterRight(widget: LoginPage()));
            },
          )
//          ListTile(
//            title: Text('Card'),
//            onTap: () {
//              Navigator.push(context, SlideRouterRight(widget: CardPage()));
//            },
//          ),
        ],
      ),
    );
  }
}
