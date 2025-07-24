import 'dart:convert';

LoginnModel loginnModelFromJson(String str) => LoginnModel.fromJson(json.decode(str));

String loginnModelToJson(LoginnModel data) => json.encode(data.toJson());

class LoginnModel {
    final String email;
    final String password;

    LoginnModel({
        required this.email,
        required this.password,
    });

    factory LoginnModel.fromJson(Map<String, dynamic> json) => LoginnModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
