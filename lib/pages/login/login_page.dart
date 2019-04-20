import 'package:flutter/material.dart';
import 'package:tg/pages/login/login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text('Logo'),
            ),
            height: 240.0,
          ),
        ),
        Expanded(
          child: PageView(
            controller: PageController(),
            pageSnapping: false,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              LoginForm(loginBloc: LoginBloc())
            ],
          ),
        )
      ],
    ));
  }
}
