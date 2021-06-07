import 'dart:convert';

ProductsHome productsHomeFromJson(String str) => ProductsHome.fromJson(json.decode(str));

String productsHomeToJson(ProductsHome data) => json.encode(data.toJson());

class ProductsHome {

    bool resp;
    String msj;
    List<Product> products;

    ProductsHome({
        this.resp,
        this.msj,
        this.products,
    });

    factory ProductsHome.fromJson(Map<String, dynamic> json) => ProductsHome(
        resp: json["resp"],
        msj: json["msj"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))).toList(),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {

    int uidProduct;
    String nameProduct;
    String description;
    String codeProduct;
    int stock;
    double price;
    String status;
    String picture;
    String category;

    Product({
        this.uidProduct,
        this.nameProduct,
        this.description,
        this.codeProduct,
        this.stock,
        this.price,
        this.status,
        this.picture,
        this.category,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        uidProduct: json["uidProduct"],
        nameProduct: json["nameProduct"],
        description: json["description"],
        codeProduct: json["codeProduct"],
        stock: json["stock"],
        price: json["price"].toDouble(),
        status: json["status"],
        picture: json["picture"],
        category: json["category"],
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
    };
}
