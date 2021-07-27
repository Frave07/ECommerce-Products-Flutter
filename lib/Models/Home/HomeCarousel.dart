import 'dart:convert';

HomeCarousel homeCarouselFromJson(String str) => HomeCarousel.fromJson(json.decode(str));

String homeCarouselToJson(HomeCarousel data) => json.encode(data.toJson());

class HomeCarousel {
    HomeCarousel({
        this.resp,
        this.msj,
        this.slider,
    });

    bool resp;
    String msj;
    List<SliderHome> slider;

    factory HomeCarousel.fromJson(Map<String, dynamic> json) => HomeCarousel(
        resp: json["resp"],
        msj: json["msj"],
        slider: List<SliderHome>.from(json["slider"].map((x) => SliderHome.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
    };
}

class SliderHome {
    SliderHome({
        this.id,
        this.image,
        this.category,
        this.v,
    });

    String id;
    String image;
    String category;
    int v;

    factory SliderHome.fromJson(Map<String, dynamic> json) => SliderHome(
        id: json["_id"],
        image: json["image"],
        category: json["category"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "category": category,
        "__v": v,
    };
}
