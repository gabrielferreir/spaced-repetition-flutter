import 'package:flutter/material.dart';
import 'package:tg/screens/home/home.page.dart';
import 'package:tg/screens/deck/deck.page.dart';
import 'package:tg/screens/card/card.page.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/deck': (context) => DeckPage(),
    '/card': (context) => CardPage(),
  },
    ));
