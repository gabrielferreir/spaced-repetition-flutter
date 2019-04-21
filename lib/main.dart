import 'package:flutter/material.dart';

import 'package:tg/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:tg/bloc_delegate.dart';
import 'package:tg/repository/user_repository.dart';
import 'package:tg/pages/authentication/authentication.dart';
import 'package:tg/repository/user_repository_api.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  return runApp(MaterialApp(
    title: 'Home',
    debugShowCheckedModeBanner: false,
    theme: theme,
    home: AuthenticationPage(userRepository: UserRepository(userRepositoryApi: UserRepositoryApi()))
  ));
}
