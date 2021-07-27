import 'dart:convert';

CategoriesProducts categoriesProductsFromJson(String str) => CategoriesProducts.fromJson(json.decode(str));

String categoriesProductsToJson(CategoriesProducts data) => json.encode(data.toJson());

class CategoriesProducts {
    CategoriesProducts({
        this.resp,
        this.msj,
        this.categories,
    });

    bool resp;
    String msj;
    List<Category> categories;

    factory CategoriesProducts.fromJson(Map<String, dynamic> json) => CategoriesProducts(
        resp: json["resp"],
        msj: json["msj"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.status,
        this.id,
        this.category,
        this.picture,
        this.v,
    });

    bool status;
    String id;
    String category;
    String picture;
    int v;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        status: json["status"],
        id: json["_id"],
        category: json["category"],
        picture: json["picture"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "category": category,
        "picture": picture,
        "__v": v,
    };
}
