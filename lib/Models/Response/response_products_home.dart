import 'dart:convert';

ResponseProductsHome responseProductsHomeFromJson(String str) => ResponseProductsHome.fromJson(json.decode(str));

String responseProductsHomeToJson(ResponseProductsHome data) => json.encode(data.toJson());

class ResponseProductsHome {

    ResponseProductsHome({
        required this.resp,
        required this.message,
        required this.listProducts,
    });

    bool resp;
    String message;
    List<ListProducts> listProducts;

    factory ResponseProductsHome.fromJson(Map<String, dynamic> json) => ResponseProductsHome(
        resp: json["resp"],
        message: json["message"],
        listProducts: List<ListProducts>.from(json["listProducts"].map((x) => ListProducts.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "listProducts": List<dynamic>.from(listProducts.map((x) => x.toJson())),
    };
}

class ListProducts {

    ListProducts({
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

    int uidProduct;
    String nameProduct;
    String description;
    String codeProduct;
    int stock;
    double price;
    String status;
    String picture;
    String category;
    int isFavorite;

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

    Map<String, dynamic> toJson() => {
        "uidProduct": uidProduct,
        "nameProduct": nameProduct,
        "description": description,
        "codeProduct": codeProduct,
        "stock": stock,
        "price": price,
        "status": status,
        "picture": picture,
        "category": category,
        "is_favorite": isFavorite,
    };
}
