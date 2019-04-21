import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tg/pages/authentication/authentication.dart';
import 'package:tg/repository/user_repository.dart';
import 'package:tg/pages/home/home.dart';
import 'package:tg/pages/login/login.dart';

class AuthenticationPage extends StatefulWidget {
  UserRepository userRepository;

  AuthenticationPage({Key key, @required this.userRepository})
      : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc =
        AuthenticationBloc(userRepository: widget.userRepository);
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: authenticationBloc,
      child: BlocBuilder(
          bloc: authenticationBloc,
          builder: (BuildContext context, state) {
            if (state is AuthenticationUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthenticationAuthenticated) return HomePage();

            if (state is AuthenticationUnauthenticated)
              return LoginPage(userRepository: widget.userRepository);
          }),
    );
  }
}
