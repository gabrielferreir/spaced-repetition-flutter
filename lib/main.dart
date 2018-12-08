import 'package:flutter/material.dart';
import './home.dart';
import './deck.dart';
import './card.dart';
import './router/slide_router_right.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/deck': (context) => DeckPage(),
    '/card': (context) => CardPage(),
  },
    ));
