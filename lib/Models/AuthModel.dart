import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  
    bool resp;
    String msj;
    Users users;
    String token;

    AuthModel({
        this.resp,
        this.msj,
        this.users,
        this.token,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        resp: json["resp"],
        msj: json["msj"],
        users: Users.fromJson(json["users"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "users": users.toJson(),
        "token": token,
    };
}

class Users {
    Users({
        this.id,
        this.email,
        this.users,
        this.profile
    });

    int id;
    String email;
    String users;
    String profile;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        users: json["users"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "users": users,
        "profile": profile,
    };
}

