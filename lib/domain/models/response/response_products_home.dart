
class ResponseProductsHome {

  const ResponseProductsHome({
    required this.resp,
    required this.message,
    required this.listProducts,
  });

  final bool resp;
  final String message;
  final List<ListProducts> listProducts;

  factory ResponseProductsHome.fromJson(Map<String, dynamic> json) => ResponseProductsHome(
    resp: json["resp"],
    message: json["message"],
    listProducts: List<ListProducts>.from(json["listProducts"].map((x) => ListProducts.fromJson(x))),
  );

}

class ListProducts {

  const ListProducts({
    required this.uidProduct,
    required this.nameProduct,
    required this.description,
    required this.codeProduct,
    required this.stock,
    required this.price,
    required this.status,
    required this.picture,
    required this.category,
    required this.isFavorite,
  });

  final int uidProduct;
  final String nameProduct;
  final String description;
  final String codeProduct;
  final int stock;
  final double price;
  final String status;
  final String picture;
  final String category;
  final int isFavorite;

  factory ListProducts.fromJson(Map<String, dynamic> json) => ListProducts(
    uidProduct: json["uidProduct"],
    nameProduct: json["nameProduct"],
    description: json["description"],
    codeProduct: json["codeProduct"],
    stock: json["stock"],
    price: double.parse(json["price"].toString()),
    status: json["status"] ?? '',
    picture: json["picture"],
    category: json["category"],
    isFavorite: json["is_favorite"],
  );

}
