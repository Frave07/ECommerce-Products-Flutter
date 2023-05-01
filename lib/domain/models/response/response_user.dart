
class ResponseUser {

  const ResponseUser({
    required this.resp,
    required this.message,
    required this.user,
  });

  final bool resp;
  final String message;
  final User user;

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
    resp: json["resp"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );
}

class User {

  const User({
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

  final int uid;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String reference;
  final String image;
  final String users;
  final String email;

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

}
