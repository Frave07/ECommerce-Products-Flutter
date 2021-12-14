import 'dart:convert';

ResponseDefault responseDefaultFromJson(String str) => ResponseDefault.fromJson(json.decode(str));

String responseDefaultToJson(ResponseDefault data) => json.encode(data.toJson());

class ResponseDefault {

    ResponseDefault({
        required this.resp,
        required this.message,
    });

    bool resp;
    String message;

    factory ResponseDefault.fromJson(Map<String, dynamic> json) => ResponseDefault(
        resp: json["resp"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
    };
}
