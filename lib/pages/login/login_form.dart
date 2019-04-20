import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg/pages/login/login.dart';

class LoginForm extends StatefulWidget {
  LoginBloc loginBloc;

  LoginForm({@required this.loginBloc});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                      // key: bloc.formEmail,
                      child: TextFormField(
                    autofocus: true,
                    // focusNode: bloc.emailFocusNode,
                    // controller: bloc.emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    // autovalidate: snapshot.data,
                    // validator: bloc.emailValidate),
                  )),
                ),
              )
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
//                            bloc.emailSubmitValidate(context);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text('Desejo me cadastrar'),
                  onTap: () {
//                    Navigator.push(context, SlideRouterRight(widget: RegisterPage()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
