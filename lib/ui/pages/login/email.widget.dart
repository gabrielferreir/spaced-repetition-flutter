import 'package:flutter/material.dart';
import 'package:tg/ui/pages/register/register.page.dart';
import 'package:tg/ui/common/slide_router_right.dart';

class Email extends StatefulWidget {
  TextEditingController emailController;
  Function callback;
  FocusNode focusNode;

  @override
  _EmailState createState() => _EmailState();

  Email(TextEditingController this.emailController, FocusNode this.focusNode,
      Function this.callback);
}

class _EmailState extends State<Email> {
  bool validateInClient = true;
  bool dirty = false;
  String lastValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    this.widget.emailController.addListener(() {
      setState(() {
        if (lastValue != widget.emailController.text) {
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
                            dirty = true;
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
                child: GestureDetector(
                  child: Text('Desejo me cadastrar'),
                  onTap: () {
                    Navigator.push(context,
                        SlideRouterRight(widget: RegisterPage()));
                  },
                ),
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
    if (value.isEmpty && dirty) {
      return 'Email é obrigatorio';
    } else if (dirty &&
        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Digite um email válido';
    }
  }
}
