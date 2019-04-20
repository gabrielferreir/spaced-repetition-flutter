import 'package:meta/meta.dart';

class UserRepository {

  Future<String> singin({@required String email, @required String pass}) async {
    await Future.delayed(Duration(seconds: 1));
    return '12345678';
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

}
