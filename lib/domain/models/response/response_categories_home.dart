
class ResponseCategoriesHome {

  const ResponseCategoriesHome({
    required this.resp,
    required this.message,
    required this.categories,
  });

  final bool resp;
  final String message;
  final List<Categories> categories;

  factory ResponseCategoriesHome.fromJson(Map<String, dynamic> json) => ResponseCategoriesHome(
    resp: json["resp"],
    message: json["message"],
    categories: List<Categories>.from(json["categories"].map((x) => Categories.fromJson(x))),
  );
}

class Categories {

  const Categories({
    required this.uidCategory,
    required this.category,
    required this.picture,
    required this.status,
  });

  final int uidCategory;
  final String category;
  final String picture;
  final int status;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    uidCategory: json["uidCategory"],
    category: json["category"],
    picture: json["picture"],
    status: json["status"],
  );

}
