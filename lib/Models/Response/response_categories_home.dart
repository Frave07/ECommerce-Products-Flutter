import 'dart:convert';

ResponseCategoriesHome responseCategoriesHomeFromJson(String str) => ResponseCategoriesHome.fromJson(json.decode(str));

String responseCategoriesHomeToJson(ResponseCategoriesHome data) => json.encode(data.toJson());

class ResponseCategoriesHome {

    ResponseCategoriesHome({
        required this.resp,
        required this.message,
        required this.categories,
    });

    bool resp;
    String message;
    List<Categories> categories;

    factory ResponseCategoriesHome.fromJson(Map<String, dynamic> json) => ResponseCategoriesHome(
        resp: json["resp"],
        message: json["message"],
        categories: List<Categories>.from(json["categories"].map((x) => Categories.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Categories {

    Categories({
        required this.uidCategory,
        required this.category,
        required this.picture,
        required this.status,
    });

    int uidCategory;
    String category;
    String picture;
    int status;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        uidCategory: json["uidCategory"],
        category: json["category"],
        picture: json["picture"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "uidCategory": uidCategory,
        "category": category,
        "picture": picture,
        "status": status,
    };
}
