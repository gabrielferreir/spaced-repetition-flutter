import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tg/ui/common/slide_router_right.dart';
import 'package:tg/ui/pages/home/home.page.dart';
import 'dart:async';

class LoginBloc {
  final pageController = new PageController();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  bool _emailDirty = false;
  bool _emailValidateInClient = true;

  final StreamController<bool> _ctrlEmailDirty = StreamController<bool>();
  final StreamController<bool> _ctrlEmailValidateInClient = StreamController<bool>();

  Stream<bool> get emailDirty => _ctrlEmailDirty.stream;
  Stream<bool> get streamEmailValidateInClient => _ctrlEmailValidateInClient.stream;

  Sink<bool> get setEmailValidateInClient => _ctrlEmailValidateInClient.sink;

  final passController = TextEditingController();
  final passFocusNode = FocusNode();
  bool passDirty = false;
  String lastValuePass = '';
  bool passValidateInClient = true;

  LoginBloc() {
    emailController.addListener(() {
      if (emailController.text != '') {
        _emailDirty = true;
        _ctrlEmailDirty.add(_emailDirty);
      }
      _emailValidateInClient = true;
      _ctrlEmailValidateInClient.add(_emailValidateInClient);
    });

    passController.addListener(() {
      if (lastValuePass != passController.text) {
        passDirty = true;
      }
      passValidateInClient = true;
    });
  }

  checkLogin(BuildContext context) {
    final _storage = new FlutterSecureStorage();
    final token = _storage.read(key: 'token');
    token.then((value) {
      if (value != null) {
        Navigator.pushReplacement(
            context, SlideRouterRight(widget: HomePage()));
      }
    });
  }

  nextPage() async {
    await pageController.nextPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
//    FocusScope.of(context).requestFocus(passFocusNode);
  }

  prevPage() async {
    await pageController.previousPage(
        duration: Duration(milliseconds: 280), curve: Curves.ease);
//    FocusScope.of(context).requestFocus(emailFocusNode);
  }

  focus(BuildContext context, FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  setEmailDirty(bool value) {
    _ctrlEmailDirty.sink.add(value);
  }

  toogleValidateEmail() {
    _emailValidateInClient = !_emailValidateInClient;
    _ctrlEmailValidateInClient.sink.add(_emailValidateInClient);
  }

  emailValidatorServer(String value) {
    if (value != 'pazuzu@gmail.com') {
      return 'Digite um email existente';
    }
  }

  emailValidatorClient(String value) {
//    if (value.isEmpty && dirty) {
    if (value.isEmpty && _emailDirty) {
      return 'Email é obrigatorio';
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Digite um email válido';
    }
  }

  dispose() {
    emailController.dispose();
    passController.dispose();
  }
}
