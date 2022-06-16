import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    required this.user,
  });

  final String? status;
  final User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.name,
    this.mail,
    this.company,
    this.title,
    this.message,
  });

  final String? name;
  final String? mail;
  final String? company;
  final String? title;
  final String? message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        mail: json["mail"],
        company: json["company"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mail": mail,
        "company": company,
        "title": title,
        "message": message,
      };
}
