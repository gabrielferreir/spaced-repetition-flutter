class User extends Object {
  String id;
  String name;
  String email;

  User();

  User.fromJSON(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        email = json['email'];

  @override
  String toString() {
    return 'id $id, name $name, email $email';
  }

  bool isExist() => this.id.isNotEmpty ? true : false;
}
