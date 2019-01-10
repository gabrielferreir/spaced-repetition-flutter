import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './login_model.dart';

class LoginRepo {
  static login() {
    Map<String, dynamic> pazuzu = {
      "_id": 'dajkndasj',
      "name": "Gabriel",
      "email": "gabriel@dsa.com"
    };

    final user = User.fromJSON(pazuzu);
    print(user);
  }

  static Future<User> checkEmail(email) async {
    var client = new http.Client();
    final response = await client.post(
        'http://192.168.1.7:3002/users/check-email',
        body: {'email': email});
    return new User.fromJSON(json.decode(response.body)['content']);
  }
}
