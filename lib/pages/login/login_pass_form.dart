import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg/pages/login/login.dart';
import 'package:tg/core/text_controller.dart';
import 'package:tg/pages/home/home.dart';

class LoginPassForm extends StatefulWidget {
  LoginBloc loginBloc;
  PageController pageController;

  LoginPassForm({@required this.loginBloc, @required this.pageController});

  @override
  _LoginPassFormState createState() => _LoginPassFormState();
}

class _LoginPassFormState extends State<LoginPassForm> {
  final _passController = TextController();
  final form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String name(state) =>
      state is LoginPassInitial ||
          state is LoginPassInvalid ||
          state is LoginPassLoading
          ? state.name
          : '';

  String email(state) =>
      state is LoginPassInitial ||
          state is LoginPassInvalid ||
          state is LoginPassLoading
          ? state.email
          : '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: widget.loginBloc,
        builder: (BuildContext context, LoginState state) {
          _onWidgetDidBuild(() {
            if (state is LoginSuccessful) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          });

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () =>
                                  widget.pageController
                                      .animateToPage(0,
                                      duration: Duration(milliseconds: 480),
                                      curve: Curves.ease)),
                          CircleAvatar(
                            child: Text(name(state).length > 0
                                ? name(state)[0].toUpperCase()
                                : ''),
                            backgroundColor: Theme
                                .of(context)
                                .primaryColor,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    name(state),
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    email(state),
                                    style: TextStyle(),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                          key: form,
                          child: TextFormField(
                              controller: _passController,
                              autovalidate: true,
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  errorText: state is LoginPassInvalid &&
                                      _passController.dirty
                                      ? 'Senha incorreta'
                                      : null),
                              obscureText: true,
                              validator: (String value) => _validate(value)),
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
                                onPressed: () =>
                                    _submit(name(state), email(state)),
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                child: state is LoginPassLoading
                                    ? Container(
                                  height: 24.0,
                                  width: 24.0,
                                  child: CircularProgressIndicator(),
                                )
                                    : Text(
                                  'ENTRAR',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .button,
                                ),
                              ),
                            ))),
                  ],
                )
              ],
            ),
          );
        });
  }

  _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _submit(String name, String email) {
    if (form.currentState.validate()) {
      widget.loginBloc.dispatch(
          LoginSingin(name: name, email: email, pass: _passController.text));
    }
  }

  _validate(String pass) {
    if (_passController.dirty) {
      if (pass.length == 0) return 'Esse campo é obrigatorio';
    }
    return null;
  }
}
