import 'dart:convert';

ResponseUser responseUserFromJson(String str) => ResponseUser.fromJson(json.decode(str));

String responseUserToJson(ResponseUser data) => json.encode(data.toJson());

class ResponseUser {

    ResponseUser({
        required this.resp,
        required this.message,
        required this.user,
    });

    bool resp;
    String message;
    User user;

    factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
        resp: json["resp"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "user": user.toJson(),
    };
}

class User {

    User({
        required this.uid,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.address,
        required this.reference,
        required this.image,
        required this.users,
        required this.email,
    });

    int uid;
    String firstName;
    String lastName;
    String phone;
    String address;
    String reference;
    String image;
    String users;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"] ?? 0,
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? '',
        phone: json["phone"] ?? '',
        address: json["address"] ?? '',
        reference: json["reference"] ?? '',
        image: json["image"] ?? '',
        users: json["users"] ?? '',
        email: json["email"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "address": address,
        "reference": reference,
        "image": image,
        "users": users,
        "email": email,
    };
}
