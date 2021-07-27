import 'dart:convert';

ProductsHome productsHomeFromJson(String str) => ProductsHome.fromJson(json.decode(str));

String productsHomeToJson(ProductsHome data) => json.encode(data.toJson());

class ProductsHome {
    ProductsHome({
        this.resp,
        this.msj,
        this.products,
    });

    bool resp;
    String msj;
    List<Product> products;

    factory ProductsHome.fromJson(Map<String, dynamic> json) => ProductsHome(
        resp: json["resp"],
        msj: json["msj"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
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
    CategoryId categoryId;
    int v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        id: json["_id"],
        nameProduct: json["nameProduct"],
        description: json["description"],
        codeProduct: json["codeProduct"],
        stock: json["stock"],
        price: json["price"].toDouble(),
        picture: json["picture"],
        categoryId: CategoryId.fromJson(json["category_id"]),
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
        "category_id": categoryId.toJson(),
        "__v": v,
    };
}

class CategoryId {
    CategoryId({
        this.id,
        this.category,
    });

    String id;
    String category;

    factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["_id"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
    };
}

