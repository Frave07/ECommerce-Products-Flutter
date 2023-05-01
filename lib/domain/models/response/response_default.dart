
class ResponseDefault {

  const ResponseDefault({
    required this.resp,
    required this.message,
  });

  final bool resp;
  final String message;

  factory ResponseDefault.fromJson(Map<String, dynamic> json) => ResponseDefault(
    resp: json["resp"],
    message: json["message"],
  );
}
