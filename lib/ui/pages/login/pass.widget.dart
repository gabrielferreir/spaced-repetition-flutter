import 'package:flutter/material.dart';
import './login_bloc_provider.dart';

class Pass extends StatefulWidget {
  @override
  _PassState createState() => _PassState();

  Pass();
}

class _PassState extends State<Pass> {
  LoginBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = LoginBlocProvider.of(context);
    super.didChangeDependencies();
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
