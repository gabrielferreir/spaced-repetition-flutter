import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

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
