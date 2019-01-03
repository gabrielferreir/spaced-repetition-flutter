import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/router/slide_router_right.dart';
import 'package:tg/screens/home/home.page.dart';
import 'package:tg/screens/login/email.widget.dart';
import 'package:tg/screens/login/pass.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = new PageController();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passController = TextEditingController();
  final passFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
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
            controller: controller,
            pageSnapping: false,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Email(emailController, emailFocusNode, _nextPage),
              Pass(passController, passFocusNode, _prevPage)
            ],
          ),
        )
      ],
    ));
  }

  @override
  void initState() {
    final _storage = new FlutterSecureStorage();
    final token = _storage.read(key: 'token');
    token.then((value) {
      if (value != null) {
        Navigator.pushReplacement(
            context, SlideRouterRight(widget: HomePage()));
      }
    });
  }

  _nextPage() async {
    await controller.nextPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
    FocusScope.of(context).requestFocus(passFocusNode);
  }

  _prevPage() async {
    await controller.previousPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
    FocusScope.of(context).requestFocus(emailFocusNode);
  }
}
