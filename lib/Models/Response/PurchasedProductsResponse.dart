import 'dart:convert';

PurchasedProductsResponse purchasedProductsResponseFromJson(String str) => PurchasedProductsResponse.fromJson(json.decode(str));

String purchasedProductsResponseToJson(PurchasedProductsResponse data) => json.encode(data.toJson());

class PurchasedProductsResponse {

    bool resp;
    String msg;
    List<OrderBuy> orderBuy;
    List<OrderDetail> orderDetails;

    PurchasedProductsResponse({
        this.resp,
        this.msg,
        this.orderBuy,
        this.orderDetails,
    });

    factory PurchasedProductsResponse.fromJson(Map<String, dynamic> json) => PurchasedProductsResponse(
        resp: json["resp"],
        msg: json["msg"],
        orderBuy:  List<OrderBuy>.from(json["orderBuy"].map((x) => OrderBuy.fromJson(x))).toList(),
        orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "orderBuy": List<dynamic>.from(orderBuy.map((x) => x.toJson())),
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    };
}

class OrderBuy {

    int uidOrderBuy;
    String receipt;
    DateTime datee;
    double amount;

    OrderBuy({
        this.uidOrderBuy,
        this.receipt,
        this.datee,
        this.amount,
    });

    factory OrderBuy.fromJson(Map<String, dynamic> json) => OrderBuy(
        uidOrderBuy: json["uidOrderBuy"],
        receipt: json["receipt"],
        datee: DateTime.parse(json["datee"]),
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "uidOrderBuy": uidOrderBuy,
        "receipt": receipt,
        "datee": datee.toIso8601String(),
        "amount": amount,
    };
}

class OrderDetail {

    int uidOrderDetails;
    int productId;
    String nameProduct;
    String picture;
    int quantity;
    double price;

    OrderDetail({
        this.uidOrderDetails,
        this.productId,
        this.nameProduct,
        this.picture,
        this.quantity,
        this.price,
    });

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        uidOrderDetails: json["uidOrderDetails"],
        productId: json["product_id"],
        nameProduct: json["nameProduct"],
        picture: json["picture"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "uidOrderDetails": uidOrderDetails,
        "product_id": productId,
        "nameProduct": nameProduct,
        "picture": picture,
        "quantity": quantity,
        "price": price,
    };
}
