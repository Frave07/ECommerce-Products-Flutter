
class ResponseOrderDetails {

  const ResponseOrderDetails({
    required this.resp,
    required this.msg,
    required this.orderDetails,
  });

  final bool resp;
  final String msg;
  final List<OrderDetail> orderDetails;

  factory ResponseOrderDetails.fromJson(Map<String, dynamic> json) => ResponseOrderDetails(
    resp: json["resp"],
    msg: json["msg"],
    orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
  );
}

class OrderDetail {

  const OrderDetail({
    required this.uidOrderDetails,
    required this.productId,
    required this.nameProduct,
    required this.picture,
    required this.quantity,
    required this.price,
  });

  final int uidOrderDetails;
  final int productId;
  final String nameProduct;
  final String picture;
  final int quantity;
  final int price;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    uidOrderDetails: json["uidOrderDetails"],
    productId: json["product_id"],
    nameProduct: json["nameProduct"],
    picture: json["picture"],
    quantity: json["quantity"],
    price: json["price"],
  );
}
