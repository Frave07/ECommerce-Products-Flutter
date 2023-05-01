
class ResponseOrderBuy {

  const ResponseOrderBuy({
    required this.resp,
    required this.msg,
    required this.orderBuy,
  });

  final bool resp;
  final String msg;
  final List<OrderBuy> orderBuy;

  factory ResponseOrderBuy.fromJson(Map<String, dynamic> json) => ResponseOrderBuy(
    resp: json["resp"],
    msg: json["msg"],
    orderBuy: List<OrderBuy>.from(json["orderBuy"].map((x) => OrderBuy.fromJson(x))),
  );
}

class OrderBuy {

  const OrderBuy({
    required this.uidOrderBuy,
    required this.userId,
    required this.receipt,
    required this.createdAt,
    required this.amount,
  });

  final int uidOrderBuy;
  final int userId;
  final String receipt;
  final DateTime createdAt;
  final int amount;

  factory OrderBuy.fromJson(Map<String, dynamic> json) => OrderBuy(
    uidOrderBuy: json["uidOrderBuy"],
    userId: json["user_id"],
    receipt: json["receipt"],
    createdAt: DateTime.parse(json["created_at"]),
    amount: json["amount"],
  );
}
