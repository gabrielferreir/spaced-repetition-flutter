import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg/pages/login/login.dart';

class LoginForm extends StatefulWidget {
  LoginBloc loginBloc;
  PageController pageController;

  LoginForm({@required this.loginBloc, @required this.pageController});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
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
          if (state is LoginPassInitial) {
            _onWidgetDidBuild(() {
              widget.pageController.animateToPage(1,
                  duration: Duration(milliseconds: 480), curve: Curves.ease);
            });
          }

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                            key: form,
                            child: TextFormField(
                                autofocus: true,
                                autovalidate: true,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    errorText: state is LoginEmailNotFound
                                        ? 'E-mail não existe'
                                        : null),
                                validator: (String value) => validate(value))),
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
                      child: SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48.0)),
                            onPressed: _submit,
                            child: state is LoginLoading
                                ? Container(
                                    height: 24.0,
                                    width: 24.0,
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    'ENTRAR',
                                    style: Theme.of(context).textTheme.button,
                                  )),
                      ),
                    ))
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
        });
  }

  _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _submit() {
    print('_submit');
    if (form.currentState.validate()) {
      widget.loginBloc.dispatch(LoginCheckEmail(email: _emailController.text));
    }
  }

  validate(String email) {
    print('validate $email');
    if (email.length == 0) return 'Esse campo é obrigatorio';
    return null;
  }
}
