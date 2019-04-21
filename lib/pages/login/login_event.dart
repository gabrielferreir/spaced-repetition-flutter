import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginSingin extends LoginEvent {
  String email;
  String pass;

  LoginSingin({@required this.email, @required this.pass});

  @override
  String toString() => 'LoginSingin $email $pass';
}

class LoginCheckEmail extends LoginEvent {
  String email;

  LoginCheckEmail({@required this.email});

  @override
  String toString() => 'LoginCheckEmail $email';
}

class LoginRestartState extends LoginEvent {
  @override
  String toString() => 'LoginRestartState';
}
