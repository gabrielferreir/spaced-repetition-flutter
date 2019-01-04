import 'package:flutter/material.dart';
import 'package:tg/ui/pages/login/login.page.dart';
import 'package:tg/ui/pages/login/login_bloc_provider.dart';

void main() => runApp(MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.purple[900],
          primaryColor: Colors.indigo[700],
          buttonColor: Colors.blueGrey,
          bottomAppBarColor: Colors.indigo[700]),
      home: LoginBlocProvider(
        child: LoginPage(),
      ),
    ));
