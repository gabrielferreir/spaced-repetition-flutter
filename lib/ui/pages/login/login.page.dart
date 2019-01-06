import 'package:flutter/material.dart';
import 'package:tg/ui/pages/login/pass.widget.dart';
import 'package:tg/ui/pages/login/email.widget.dart';
import './login_bloc_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (bloc != null) {
        bloc.checkLogin(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    bloc = LoginBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
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
            controller: bloc.pageController,
            pageSnapping: false,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Email(),
              Pass(),
            ],
          ),
        )
      ],
    ));
  }
}
