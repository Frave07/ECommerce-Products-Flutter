import 'dart:convert';

ResponseOrderBuy responseOrderBuyFromJson(String str) => ResponseOrderBuy.fromJson(json.decode(str));

String responseOrderBuyToJson(ResponseOrderBuy data) => json.encode(data.toJson());

class ResponseOrderBuy {

    ResponseOrderBuy({
        required this.resp,
        required this.msg,
        required this.orderBuy,
    });

    bool resp;
    String msg;
    List<OrderBuy> orderBuy;

    factory ResponseOrderBuy.fromJson(Map<String, dynamic> json) => ResponseOrderBuy(
        resp: json["resp"],
        msg: json["msg"],
        orderBuy: List<OrderBuy>.from(json["orderBuy"].map((x) => OrderBuy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "orderBuy": List<dynamic>.from(orderBuy.map((x) => x.toJson())),
    };
}

class OrderBuy {

    OrderBuy({
        required this.uidOrderBuy,
        required this.userId,
        required this.receipt,
        required this.createdAt,
        required this.amount,
    });

    int uidOrderBuy;
    int userId;
    String receipt;
    DateTime createdAt;
    int amount;

    factory OrderBuy.fromJson(Map<String, dynamic> json) => OrderBuy(
        uidOrderBuy: json["uidOrderBuy"],
        userId: json["user_id"],
        receipt: json["receipt"],
        createdAt: DateTime.parse(json["created_at"]),
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "uidOrderBuy": uidOrderBuy,
        "user_id": userId,
        "receipt": receipt,
        "created_at": createdAt.toIso8601String(),
        "amount": amount,
    };
}
