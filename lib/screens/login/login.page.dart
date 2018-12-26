import 'package:flutter/material.dart';
import 'package:tg/router/slide_router_right.dart';
import 'package:tg/screens/home/home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = new PageController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
              _email(emailController, _nextPage),
              _pass(passController, _prevPage),
            ],
          ),
        )
      ],
    ));
  }

  _nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
  }

  _prevPage() {
    controller.previousPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
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
  bool validateInClient = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    this.widget.emailController.addListener(() {
      setState(() {
        validateInClient = true;
      });
    });
  }

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
                      key: _formKey,
                      child: TextFormField(
                          autofocus: true,
                          controller: this.widget.emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          autovalidate: validateInClient,
                          validator: (value) {
                            return validateInClient
                                ? validatorClient(value)
                                : validatorServer(value);
                          }),
                    )),
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
                            if (_formKey.currentState.validate()) {
                              validateInClient = !validateInClient;
                              if (_formKey.currentState.validate()) {
                                widget.callback();
                              }
                            }
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
      ),
    );
  }

  validatorServer(String value) {
    print('validatorServer');
    if (value != 'pazuzu@gmail.com') {
      return 'Digite um email existente';
    }
  }

  validatorClient(String value) {
    print('validatorClient');
    if (value.isEmpty) {
      return 'Email é obrigatorio';
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Digite um email válido';
    }
  }
}

class _pass extends StatefulWidget {
  TextEditingController passController;
  Function callback;

  @override
  __passState createState() => __passState();

  _pass(TextEditingController this.passController, Function this.callback);
}

class __passState extends State<_pass> {
  bool validateInClient = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    this.widget.passController.addListener(() {
      setState(() {
        validateInClient = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {
                          this.widget.callback();
                        }),
                    Text(
                      'gabriel.ferreira@outlook.com.br',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
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
                    key: _formKey,
                    child: TextFormField(
                        autofocus: true,
                        controller: this.widget.passController,
                        decoration: InputDecoration(labelText: 'Senha'),
                        autovalidate: validateInClient,
                        validator: (value) {
                          return validateInClient
                              ? validatorClient(value)
                              : validatorServer(value);
                        }),
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
                            if (_formKey.currentState.validate()) {
                              validateInClient = !validateInClient;
                              if (_formKey.currentState.validate()) {
                                Navigator.pushReplacement(context,
                                    SlideRouterRight(widget: HomePage()));
                              }
                            }
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
  }

  validatorServer(String value) {
    if (value != 'teste123') {
      return 'Digite uma senha válida';
    }
  }

  validatorClient(String value) {
    if (value.isEmpty) {
      return 'Senha é obrigatoria';
    } else if (value.length < 8) {
      return 'A senha deve conter no minimo 8 caracteres';
    }
  }
}
