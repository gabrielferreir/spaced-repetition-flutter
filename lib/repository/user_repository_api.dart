import 'package:meta/meta.dart';
import 'package:tg/core/api.dart';

class UserRepositoryApi {
  Api api;

  UserRepositoryApi({api}) : this.api = api ?? Api();

  Future<ApiResponse> checkEmail({@required email}) async {
    return await this.api.request(
        method: Method.post, url: '/users/check-email', body: {'email': email});
  }

  Future<ApiResponse> singin({@required email, @required pass}) async {
    return await this.api.request(
        method: Method.post,
        url: '/users/login',
        body: {'email': email, 'pass': pass});
  }
}
