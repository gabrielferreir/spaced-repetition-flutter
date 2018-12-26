import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/router/slide_router_right.dart';
import 'package:tg/screens/home/home.page.dart';

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
              _email(emailController, emailFocusNode, _nextPage),
              _pass(passController, passFocusNode, _prevPage),
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

class _email extends StatefulWidget {
  TextEditingController emailController;
  Function callback;
  FocusNode focusNode;

  @override
  __emailState createState() => __emailState();

  _email(TextEditingController this.emailController, FocusNode this.focusNode,
      Function this.callback);
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
                          focusNode: this.widget.focusNode,
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
    if (value != 'pazuzu@gmail.com') {
      return 'Digite um email existente';
    }
  }

  validatorClient(String value) {
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
  FocusNode focusNode;

  @override
  __passState createState() => __passState();

  _pass(TextEditingController this.passController, FocusNode this.focusNode,
      Function this.callback);
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
                    CircleAvatar(
                      child: Text('G'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gabriel Ferreira',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'gabriel.ferreira@outlook.com.br',
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
                    key: _formKey,
                    child: TextFormField(
                        focusNode: this.widget.focusNode,
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
                                saveInStorage(widget.passController.text);
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

  saveInStorage(String pass) {
    final _storage = new FlutterSecureStorage();
    _storage.write(key: 'token', value: pass);
  }
}
