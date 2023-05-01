
class ResponseSlideProducts {

  const ResponseSlideProducts({
    required this.resp,
    required this.message,
    required this.slideProducts,
  });

  final bool resp;
  final String message;
  final List<SlideProduct> slideProducts;

  factory ResponseSlideProducts.fromJson(Map<String, dynamic> json) => ResponseSlideProducts(
    resp: json["resp"],
    message: json["message"],
    slideProducts: List<SlideProduct>.from(json["slideProducts"].map((x) => SlideProduct.fromJson(x))),
  );
}

class SlideProduct {

  const SlideProduct({
    required this.uidCarousel,
    required this.image,
    required this.category,
  });

  final int uidCarousel;
  final String image;
  final String category;

  factory SlideProduct.fromJson(Map<String, dynamic> json) => SlideProduct(
    uidCarousel: json["uidCarousel"],
    image: json["image"],
    category: json["category"],
  );

}
