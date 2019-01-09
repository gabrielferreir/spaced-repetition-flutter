import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import 'package:tg/ui/pages/home/home.page.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class LoginBloc {
  final pageController = new PageController();

  // Email
  bool _emailDirty = false;
  bool _emailValidateInClient = true;
  final formEmail = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final StreamController<bool> _ctrlEmailDirty = BehaviorSubject<bool>();
  final StreamController<bool> _ctrlEmailValidateInClient = BehaviorSubject<bool>();

  Stream<bool> get emailDirty => _ctrlEmailDirty.stream;

  Stream<bool> get streamEmailValidateInClient =>
      _ctrlEmailValidateInClient.stream;

  // Pass
  bool _passDirty = false;
  bool _passValidateInClient = true;
  final formPass = GlobalKey<FormState>();
  final passController = TextEditingController();
  final passFocusNode = FocusNode();

  final StreamController<bool> _ctrlPassValidateInClient =
      StreamController<bool>();

  Stream<bool> get streamPassValidateInClient =>
      _ctrlPassValidateInClient.stream;

  LoginBloc() {
    _emailListenerDirty();
    _passListenerDirty();
  }

  dispose() {
    emailController.dispose();
    passController.dispose();
  }

  void checkLogin(BuildContext context) {
    final _storage = new FlutterSecureStorage();
    final token = _storage.read(key: 'token');
    token.then((value) {
      if (value != null) {
        Navigator.pushReplacement(
            context, SlideRouterRight(widget: HomePage()));
      }
    });
  }

  void saveLogin(String pass) {
    final _storage = new FlutterSecureStorage();
    _storage.write(key: 'token', value: pass);
  }

  String emailValidate(String value) {
    return _emailValidateInClient
        ? _emailValidatorClient(value)
        : _emailValidatorServer(value);
  }

  String passValidate(String value) {
    return _passValidateInClient
        ? _passValidatorClient(value)
        : _passValidatorServer(value);
  }

  void emailSubmitValidate(BuildContext context) {
    _emailDirty = true;
    if (formEmail.currentState.validate()) {
      _emailValidateInClient = !_emailValidateInClient;
      _ctrlEmailValidateInClient.sink.add(_emailValidateInClient);
      if (formEmail.currentState.validate()) {
        nextPage(context);
      }
    }
  }

  void passSubmitValidate(BuildContext context) {
    _passDirty = true;
    if (formPass.currentState.validate()) {
      _passValidateInClient = !_passValidateInClient;
      if (formPass.currentState.validate()) {
        saveLogin(passController.text);
        Navigator.pushReplacement(
            context, SlideRouterRight(widget: HomePage()));
      }
    }
  }

  void nextPage(BuildContext context) async {
    await pageController.nextPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
    FocusScope.of(context).requestFocus(passFocusNode);
  }

  void prevPage(BuildContext context) async {
    await pageController.previousPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
    FocusScope.of(context).requestFocus(emailFocusNode);
  }

  void focus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  setEmailDirty(bool value) {
    _ctrlEmailDirty.sink.add(value);
  }

  toogleValidateEmail() {
    _emailValidateInClient = !_emailValidateInClient;
    _ctrlEmailValidateInClient.sink.add(_emailValidateInClient);
  }

  String validateEmail(value) {
    _emailValidateInClient
        ? _emailValidatorClient(value)
        : _emailValidatorServer(value);
  }

  _emailValidatorServer(String value) {

    if (value != 'pazuzu@gmail.com') {
      return 'Digite um email existente';
    }
  }

  String _emailValidatorClient(String value) {
    if (value.isEmpty && _emailDirty) {
      return 'Email é obrigatorio';
    } else if (_emailDirty &&
        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Digite um email válido';
    }
  }

  String _passValidatorServer(String value) {
    if (value != 'teste123') {
      return 'Digite uma senha válida';
    }
  }

  String _passValidatorClient(String value) {
    if (value.isEmpty && _passDirty) {
      return 'Senha é obrigatoria';
    } else if (_passDirty && value.length < 8) {
      return 'A senha deve conter no minimo 8 caracteres';
    }
  }

  void _emailListenerDirty() {
    emailController.addListener(() {
      if (emailController.text != '') {
        _emailDirty = true;
      }
      _emailValidateInClient = true;
      _ctrlEmailValidateInClient.add(_emailValidateInClient);
    });
  }

  void _passListenerDirty() {
    passController.addListener(() {
      if (passController.text != '') {
        _passDirty = true;
      }
      _passValidateInClient = true;
      _ctrlPassValidateInClient.add(_passValidateInClient);
    });
  }
}
