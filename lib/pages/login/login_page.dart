import 'package:flutter/material.dart';
import 'package:tg/pages/login/login.dart';
import 'package:tg/repository/user_repository.dart';

class LoginPage extends StatefulWidget {
  UserRepository userRepository;

  LoginPage({@required this.userRepository}) : assert(userRepository != null);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = LoginBloc(userRepository: widget.userRepository);
    super.initState();
  }

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
            children: <Widget>[LoginForm(loginBloc: loginBloc)],
          ),
        )
      ],
    ));
  }
}
