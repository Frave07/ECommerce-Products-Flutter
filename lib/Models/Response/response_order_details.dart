import 'dart:convert';

ResponseOrderDetails responseOrderDetailsFromJson(String str) => ResponseOrderDetails.fromJson(json.decode(str));

String responseOrderDetailsToJson(ResponseOrderDetails data) => json.encode(data.toJson());

class ResponseOrderDetails {

    ResponseOrderDetails({
        required this.resp,
        required this.msg,
        required this.orderDetails,
    });

    bool resp;
    String msg;
    List<OrderDetail> orderDetails;

    factory ResponseOrderDetails.fromJson(Map<String, dynamic> json) => ResponseOrderDetails(
        resp: json["resp"],
        msg: json["msg"],
        orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
    };
}

class OrderDetail {

    OrderDetail({
        required this.uidOrderDetails,
        required this.productId,
        required this.nameProduct,
        required this.picture,
        required this.quantity,
        required this.price,
    });

    int uidOrderDetails;
    int productId;
    String nameProduct;
    String picture;
    int quantity;
    int price;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        uidOrderDetails: json["uidOrderDetails"],
        productId: json["product_id"],
        nameProduct: json["nameProduct"],
        picture: json["picture"],
        quantity: json["quantity"],
        price: json["price"],
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
