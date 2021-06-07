import 'dart:convert';

HomeCarousel homeCarouselFromJson(String str) => HomeCarousel.fromJson(json.decode(str));

String homeCarouselToJson(HomeCarousel data) => json.encode(data.toJson());

class HomeCarousel {

    bool resp;
    String msj;
    List<SliderHome> slider;

    HomeCarousel({
        this.resp,
        this.msj,
        this.slider,
    });

    factory HomeCarousel.fromJson(Map<String, dynamic> json) => HomeCarousel(
        resp: json["resp"],
        msj: json["msj"],
        slider: List<SliderHome>.from(json["slider"].map((x) => SliderHome.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
    };
}

class SliderHome {

    int uidCarousel;
    String image;
    String category;

    SliderHome({
        this.uidCarousel,
        this.image,
        this.category,
    });

    factory SliderHome.fromJson(Map<String, dynamic> json) => SliderHome(
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
