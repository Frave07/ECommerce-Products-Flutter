import 'dart:convert';

ResponseModels responseModelsFromJson(String str) => ResponseModels.fromJson(json.decode(str));

String responseModelsToJson(ResponseModels data) => json.encode(data.toJson());

class ResponseModels {

    bool resp;
    String msj;

    ResponseModels({
        this.resp,
        this.msj,
    });

    factory ResponseModels.fromJson(Map<String, dynamic> json) => ResponseModels(
        resp: json["resp"],
        msj: json["msj"],
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
    };
}
