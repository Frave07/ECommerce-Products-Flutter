import 'dart:convert';

ResponseSlideProducts responseSlideProductsFromJson(String str) => ResponseSlideProducts.fromJson(json.decode(str));

String responseSlideProductsToJson(ResponseSlideProducts data) => json.encode(data.toJson());

class ResponseSlideProducts {

    ResponseSlideProducts({
        required this.resp,
        required this.message,
        required this.slideProducts,
    });

    bool resp;
    String message;
    List<SlideProduct> slideProducts;

    factory ResponseSlideProducts.fromJson(Map<String, dynamic> json) => ResponseSlideProducts(
        resp: json["resp"],
        message: json["message"],
        slideProducts: List<SlideProduct>.from(json["slideProducts"].map((x) => SlideProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "slideProducts": List<dynamic>.from(slideProducts.map((x) => x.toJson())),
    };
}

class SlideProduct {

    SlideProduct({
        required this.uidCarousel,
        required this.image,
        required this.category,
    });

    int uidCarousel;
    String image;
    String category;

    factory SlideProduct.fromJson(Map<String, dynamic> json) => SlideProduct(
        uidCarousel: json["uidCarousel"],
        image: json["image"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "uidCarousel": uidCarousel,
        "image": image,
        "category": category,
    };
}
