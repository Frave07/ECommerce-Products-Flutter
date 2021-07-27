// To parse this JSON data, do
//
//     final purchasedProductsResponse = purchasedProductsResponseFromJson(jsonString);

import 'dart:convert';

PurchasedProductsResponse purchasedProductsResponseFromJson(String str) => PurchasedProductsResponse.fromJson(json.decode(str));

String purchasedProductsResponseToJson(PurchasedProductsResponse data) => json.encode(data.toJson());

class PurchasedProductsResponse {
    PurchasedProductsResponse({
        this.resp,
        this.msg,
        this.orderBuy,
        this.orderDetails,
    });

    bool resp;
    String msg;
    OrderBuy orderBuy;
    List<OrderDetail> orderDetails;

    factory PurchasedProductsResponse.fromJson(Map<String, dynamic> json) => PurchasedProductsResponse(
        resp: json["resp"],
        msg: json["msg"],
        orderBuy: OrderBuy.fromJson(json["orderBuy"]),
        orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "orderBuy": orderBuy.toJson(),
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    };
}

class OrderBuy {
    OrderBuy({
        this.id,
        this.userId,
        this.receipt,
        this.datee,
        this.amount,
        this.v,
    });

    String id;
    String userId;
    String receipt;
    DateTime datee;
    double amount;
    int v;

    factory OrderBuy.fromJson(Map<String, dynamic> json) => OrderBuy(
        id: json["_id"],
        userId: json["user_id"],
        receipt: json["receipt"],
        datee: DateTime.parse(json["datee"]),
        amount: json["amount"].toDouble(),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "receipt": receipt,
        "datee": datee.toIso8601String(),
        "amount": amount,
        "__v": v,
    };
}

class OrderDetail {
    OrderDetail({
        this.id,
        this.productId,
        this.orderBuyId,
        this.quantity,
        this.price,
        this.v,
    });

    String id;
    ProductId productId;
    String orderBuyId;
    int quantity;
    double price;
    int v;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["_id"],
        productId: ProductId.fromJson(json["product_id"]),
        orderBuyId: json["orderBuy_id"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "product_id": productId.toJson(),
        "orderBuy_id": orderBuyId,
        "quantity": quantity,
        "price": price,
        "__v": v,
    };
}

class ProductId {
    ProductId({
        this.id,
        this.nameProduct,
        this.price,
        this.picture,
    });

    String id;
    String nameProduct;
    double price;
    String picture;

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        nameProduct: json["nameProduct"],
        price: json["price"].toDouble(),
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nameProduct": nameProduct,
        "price": price,
        "picture": picture,
    };
}
