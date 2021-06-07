import 'dart:convert';

CategoriesProducts homeCarouselFromJson(String str) => CategoriesProducts.fromJson(json.decode(str));

String homeCarouselToJson(CategoriesProducts data) => json.encode(data.toJson());

class CategoriesProducts {

    bool resp;
    String msj;
    List<Category> categories;

    CategoriesProducts({
        this.resp,
        this.msj,
        this.categories,
    });

    factory CategoriesProducts.fromJson(Map<String, dynamic> json) => CategoriesProducts(
        resp: json["resp"],
        msj: json["msj"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {

    int uidCategory;
    String category;
    String picture;
    int status;

    Category({
        this.uidCategory,
        this.category,
        this.picture,
        this.status,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        uidCategory: json["uidCategory"],
        category: json["category"],
        picture: json['picture'],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "uidCategory": uidCategory,
        "category": category,
        "picture": picture,
        "status": status,
    };
}
