import 'package:meta/meta.dart';
import 'package:tg/repository/user_repository_api.dart';
import 'package:tg/core/exceptions.dart';

class UserRepository {
  UserRepositoryApi userRepositoryApi;

  UserRepository({userRepositoryApi})
      : this.userRepositoryApi = userRepositoryApi ?? UserRepositoryApi();

  Future<String> singin({@required String email, @required String pass}) async {
    await Future.delayed(Duration(seconds: 1));
    return '12345678';
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> checkEmail({@required email}) async {
    final response = await this.userRepositoryApi.checkEmail(email: email);

    if (response.statusCode == 200) return true;
    if (response.statusCode == 404) return false;
    return throw UnknownException();
  }



}
