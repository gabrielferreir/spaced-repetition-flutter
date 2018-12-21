import 'package:flutter/material.dart';
import 'package:tg/router/slide_router_right.dart';
import 'package:tg/screens/home/home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

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
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    autofocus: true,
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, SlideRouterRight(widget: HomePage()));
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}

//Positioned(
//bottom: 0.0,
//left: 0.0,
//child: SizedBox.expand(
//child: Padding(
//padding: EdgeInsets.all(0.0),
//child: FlatButton(
//onPressed: () {},
//color: Theme.of(context).primaryColor,
//child: Text(
//'ENTRAR',
//style: TextStyle(color: Colors.white),
//))),
//),
//)
