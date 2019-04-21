import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg/pages/login/login.dart';
import 'package:tg/core/text_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: widget.loginBloc,
        builder: (BuildContext context, LoginState state) {
          print(state.toString());
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
                              onPressed: () => widget.pageController
                                  .animateToPage(0,
                                      duration: Duration(milliseconds: 480),
                                      curve: Curves.ease)),
                          CircleAvatar(
                            child: Text(state is LoginPassInitial
                                ? '${state.name[0].toUpperCase()}'
                                : ''),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    state is LoginPassInitial
                                        ? '${state.name}'
                                        : '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state is LoginPassInitial
                                        ? '${state.email}'
                                        : '',
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
//                          key: bloc.formPass,
                          child: TextFormField(
                              controller: _passController,
                              decoration: InputDecoration(labelText: 'Senha'),
                              obscureText: true,
                              validator: (String value) => validate(value)),
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
//                                  bloc.passSubmitValidate(context);
                                },
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  'ENTRAR',
                                  style: TextStyle(color: Colors.white),
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

  _submit() {
    if (form.currentState.validate()) {
      widget.loginBloc.dispatch(LoginCheckEmail(email: _passController.text));
    }
  }

  validate(String pass) {
    if (_passController.dirty) {
      if (pass.length == 0) return 'Esse campo é obrigatorio';
    }
    return null;
  }
}
