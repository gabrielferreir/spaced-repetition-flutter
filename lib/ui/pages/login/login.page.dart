import 'package:flutter/material.dart';
import 'package:tg/ui/pages/register/register.page.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import './login_bloc_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    bloc = LoginBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = LoginBlocProvider.of(context);
    bloc.checkLogin(context);
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
              email(bloc),
              pass(bloc),
            ],
          ),
        )
      ],
    ));
  }

  Widget email(bloc) {
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

  Widget pass(bloc) {
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
                          bloc.prevPage(context);
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
                    key: bloc.formPass,
                    child: StreamBuilder(
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return TextFormField(
                            focusNode: bloc.passFocusNode,
                            controller: bloc.passController,
                            decoration: InputDecoration(labelText: 'Senha'),
                            autovalidate: snapshot.data,
                            obscureText: true,
                            validator: bloc.passValidate);
                      },
                      stream: bloc.streamPassValidateInClient,
                      initialData: true,
                    ),
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
                            bloc.passSubmitValidate(context);
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

}
