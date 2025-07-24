import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    final String userName;
    final String email;
    final String password;

    RegistrationModel({
        required this.userName,
        required this.email,
        required this.password,
    });

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
    };
}
