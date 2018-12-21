import 'package:flutter/material.dart';
import 'package:tg/router/slide_router_right.dart';
import 'package:tg/screens/home/home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final controller = new PageController();
  final emailController = TextEditingController();

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
            controller: controller,
            children: <Widget>[
              _email(emailController, _nextPage),
              _pass(emailController, _prevPage),
            ],
          ),
        )
      ],
    ));
  }

  _nextPage() {
    controller.nextPage(duration: Duration(milliseconds: 280), curve: Curves.ease);
  }

  _prevPage() {
    controller.previousPage(duration: Duration(milliseconds: 280), curve: Curves.ease);
  }

}

class _email extends StatefulWidget {
  TextEditingController emailController;
  Function callback;

  @override
  __emailState createState() => __emailState();

  _email(TextEditingController this.emailController, Function this.callback);
}

class __emailState extends State<_email> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  autofocus: true,
                  controller: this.widget.emailController,
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
                      height: 48.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.0)),
                        onPressed: () {
                          widget.callback();
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Desejo me cadastrar'),
            )
          ],
        )
      ],
    );
  }
}

class _pass extends StatefulWidget {
  TextEditingController emailController;
  Function callback;

  @override
  __passState createState() => __passState();

  _pass(TextEditingController this.emailController, Function this.callback);
}

class __passState extends State<_pass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  autofocus: true,
                  controller: this.widget.emailController,
                  decoration: InputDecoration(labelText: 'Senha'),
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
                      height: 48.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.0)),
                        onPressed: () {
                          widget.callback();
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Desejo me cadastrar'),
            )
          ],
        )
      ],
    );
  }
}

