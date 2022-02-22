class AuthModel {
  AuthModel({
    this.message,
    this.email,
    this.username,
    this.fullname,
    this.picture,
    this.accessToken,
    this.type,
    this.uid,
  });

  bool? message;
  String? fullname;
  String? picture;
  String? accessToken;
  String? type;
  String? email;
  String? username;
  int? uid;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        fullname: json["fullname"],
        picture: json["picture"],
        accessToken: json["accessToken"],
        type: json["type"],
        email: json["email"],
        username: json["username"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "fullname": fullname,
        "picture": picture,
        "accessToken": accessToken,
        "type": type,
        "email": email,
        "username": username,
        "uid": uid,
      };
}
