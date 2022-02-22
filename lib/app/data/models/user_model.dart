import 'package:get/state_manager.dart';

class UserModel {
  UserModel({
    required name,
    required uid,
    required location,
    required username,
    required picture,
    required email,
    required password,
  }) {
    this.name = name;
    this.uid = uid;
    this.location = location;
    this.username = username;
    this.picture = picture;
    this.email = email;
    this.password = password;
  }

  // RxString name = RxString('');
  // RxInt uid = RxInt(0);
  // RxString location = RxString('');
  // RxString username = RxString('');
  // RxString picture = RxString('');
  // RxString email = RxString('');
  // RxString password = RxString('');

  final RxString _name = RxString("");
  set name(String value) => _name.value = value;
  String get name => _name.value;

  final RxInt _uid = RxInt(0);
  set uid(int value) => _uid.value = value;
  int get uid => _uid.value;

  final RxString _location = RxString("");
  set location(String value) => _location.value = value;
  String get location => _location.value;

  final RxString _username = RxString("");
  set username(String value) => _username.value = value;
  String get username => _username.value;

  final RxString _picture = RxString("");
  set picture(String value) => _picture.value = value;
  String get picture => _picture.value;

  final RxString _email = RxString("");
  set email(String value) => _email.value = value;
  String get email => _email.value;

  final RxString _password = RxString("");
  set password(String value) => _password.value = value;
  String get password => _password.value;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        uid: json["uid"],
        location: json["location"],
        username: json["username"],
        picture: json["picture"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "location": location,
        "username": username,
        "picture": picture,
        "email": email,
        "password": password,
      };
}
