import 'package:flutter/material.dart';
import './login_bloc.dart';
export './login_bloc.dart';

class LoginBlocProvider extends InheritedWidget {
  final LoginBloc bloc;

  LoginBlocProvider({Key key, Widget child})
      : bloc = LoginBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginBlocProvider)
            as LoginBlocProvider)
        .bloc;
  }

}
