class User extends Object {
  String id;
  String name;
  String email;

  User.fromJSON(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }
}
