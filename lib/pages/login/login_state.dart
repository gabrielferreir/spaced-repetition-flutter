import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginEmailNotFound extends LoginState {
  @override
  String toString() => 'LoginEmailNotFound';
}

class LoginPassInitial extends LoginState {
  final String name;
  final String email;

  LoginPassInitial({@required this.name, @required this.email})
      : super([name, email]);

  @override
  String toString() => 'LoginPassInitial: $name - $email';
}

class LoginPassInvalid extends LoginState {
  final String name;
  final String email;

  LoginPassInvalid({@required this.name, @required this.email})
      : super([name, email]);

  @override
  String toString() => 'LoginPassInitial: $name - $email';
}

class LoginPassLoading extends LoginState {
  final String name;
  final String email;

  LoginPassLoading({@required this.name, @required this.email})
      : super([name, email]);

  @override
  String toString() => 'LoginPassLoading';
}

class LoginSuccessful extends LoginState {
  @override
  String toString() => 'LoginSuccessful';
}
