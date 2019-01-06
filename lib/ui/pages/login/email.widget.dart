import 'package:flutter/material.dart';
import 'package:tg/ui/pages/register/register.page.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import './login_bloc_provider.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();

  Email();
}

class _EmailState extends State<Email> {
  LoginBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = LoginBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {}

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
                      key: bloc.formEmail,
                      child: StreamBuilder(
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return TextFormField(
                                autofocus: true,
                                focusNode: bloc.emailFocusNode,
                                controller: bloc.emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                                autovalidate: snapshot.data,
                                validator: bloc.emailValidate);
                          },
                          initialData: true,
                          stream: bloc.streamEmailValidateInClient),
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
                            bloc.emailSubmitValidate(context);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )))
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
                    Navigator.push(
                        context, SlideRouterRight(widget: RegisterPage()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
