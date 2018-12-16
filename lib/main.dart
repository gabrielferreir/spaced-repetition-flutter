import 'package:flutter/material.dart';
import 'package:tg/screens/home/home.page.dart';
import 'package:tg/screens/deck/deck.page.dart';
import 'package:tg/screens/card/card.page.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    accentColor: Colors.purple[900],
    primaryColor: Colors.indigo[700],
    buttonColor: Colors.blueGrey,
    bottomAppBarColor: Colors.indigo[700]
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/deck': (context) => DeckPage(),
    '/card': (context) => CardPage(),
  },
    ));
