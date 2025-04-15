part of 'model.dart';


class User {
    int id;
    String name;
    String email;
    String password;
    int isVerif;
    dynamic otp;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.isVerif,
        required this.otp,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isVerif: json["isVerif"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "isVerif": isVerif,
        "otp": otp,
    };
}