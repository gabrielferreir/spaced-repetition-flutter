import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import 'package:tg/ui/pages/home/home.page.dart';

class Pass extends StatefulWidget {
  TextEditingController passController;
  Function callback;
  FocusNode focusNode;

  @override
  _PassState createState() => _PassState();

  Pass(TextEditingController this.passController, FocusNode this.focusNode,
      Function this.callback);
}

class _PassState extends State<Pass> {
  bool validateInClient = true;
  bool dirty = false;
  String lastValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    this.widget.passController.addListener(() {
      setState(() {
        if (lastValue != widget.passController.text) {
          dirty = true;
        }
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
                            setState(() {
                              dirty = true;
                            });
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
    if (value.isEmpty && dirty) {
      return 'Senha é obrigatoria';
    } else if (dirty && value.length < 8) {
      return 'A senha deve conter no minimo 8 caracteres';
    }
  }

  saveInStorage(String pass) {
    final _storage = new FlutterSecureStorage();
    _storage.write(key: 'token', value: pass);
  }
}