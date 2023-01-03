class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String avatar;
  bool error;
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.avatar,
      this.error});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    email = json['email'] as String;
    password = json['password'] as String;
    avatar = json['avatar'] as String;
    error = false;
  }

  User.withError({String err}) {
    id = err;
    firstName = "";
    lastName = "";
    email = "";
    password = "";
    avatar = "";
    error = true;
  }
}
