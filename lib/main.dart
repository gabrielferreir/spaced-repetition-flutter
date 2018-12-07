import 'package:flutter/material.dart';
import './home.dart';
import './deck.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/deck': (context) => DeckPage(),
      },
    ));
