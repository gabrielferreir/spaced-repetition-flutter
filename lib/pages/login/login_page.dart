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
  final pageController = PageController();

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
        Container(
          color: Colors.black12,
          child: Center(
            child: FlutterLogo(
              size: 120.0,
              colors: Colors.indigo,
            ),
          ),
          height: 240.0,
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            pageSnapping: false,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              LoginEmailForm(
                  loginBloc: loginBloc, pageController: pageController),
              LoginPassForm(
                  loginBloc: loginBloc, pageController: pageController)
            ],
          ),
        )
      ],
    ));
  }
}
