import 'dart:convert';

FavoriteProduct favoriteProductFromJson(String str) => FavoriteProduct.fromJson(json.decode(str));

String favoriteProductToJson(FavoriteProduct data) => json.encode(data.toJson());

class FavoriteProduct {
    FavoriteProduct({
        this.resp,
        this.msj,
        this.favorites,
    });

    bool resp;
    String msj;
    List<Favorite> favorites;

    factory FavoriteProduct.fromJson(Map<String, dynamic> json) => FavoriteProduct(
        resp: json["resp"],
        msj: json["msj"],
        favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
    };
}

class Favorite {
    Favorite({
        this.id,
        this.productId,
        this.userId,
        this.v,
    });

    String id;
    ProductId productId;
    String userId;
    int v;

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["_id"],
        productId: ProductId.fromJson(json["product_id"]),
        userId: json["user_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "product_id": productId.toJson(),
        "user_id": userId,
        "__v": v,
    };
}

class ProductId {
    ProductId({
        this.status,
        this.id,
        this.nameProduct,
        this.description,
        this.codeProduct,
        this.stock,
        this.price,
        this.picture,
        this.categoryId,
        this.v,
    });

    String status;
    String id;
    String nameProduct;
    String description;
    String codeProduct;
    int stock;
    double price;
    String picture;
    String categoryId;
    int v;

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        status: json["status"],
        id: json["_id"],
        nameProduct: json["nameProduct"],
        description: json["description"],
        codeProduct: json["codeProduct"],
        stock: json["stock"],
        price: json["price"].toDouble(),
        picture: json["picture"],
        categoryId: json["category_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "nameProduct": nameProduct,
        "description": description,
        "codeProduct": codeProduct,
        "stock": stock,
        "price": price,
        "picture": picture,
        "category_id": categoryId,
        "__v": v,
    };
}
