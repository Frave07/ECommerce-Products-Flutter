import 'dart:convert';
import 'package:e_commers/Models/Response/response_order_buy.dart';
import 'package:e_commers/Models/Response/response_order_details.dart';
import 'package:http/http.dart' as http;
import 'package:e_commers/Helpers/secure_storage_frave.dart';
import 'package:e_commers/Models/product.dart';
import 'package:e_commers/Models/Response/response_categories_home.dart';
import 'package:e_commers/Models/Response/response_default.dart';
import 'package:e_commers/Models/Response/response_products_home.dart';
import 'package:e_commers/Models/Response/response_slide_products.dart';
import 'package:e_commers/Service/urls.dart';


class ProductServices {


  Future<List<SlideProduct>> listProductsHomeCarousel() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-home-products-carousel'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );

    return ResponseSlideProducts.fromJson(jsonDecode(resp.body)).slideProducts;
  }


  Future<List<Categories>> listCategoriesHome() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/category/get-all-categories'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseCategoriesHome.fromJson(jsonDecode(resp.body)).categories;
  }


  Future<List<ListProducts>> listProductsHome() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-products-home'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseProductsHome.fromJson(jsonDecode(resp.body)).listProducts;
  }


  Future<ResponseDefault> addOrDeleteProductFavorite(String uidProduct) async {

    final token = await secureStorage.readToken();

    final resp = await http.post(Uri.parse('${URLS.urlApi}/product/like-or-unlike-product'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
      body: {
        'uidProduct' : uidProduct
      }
    );
    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }


  Future<List<Categories>> getAllCategories() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/category/get-all-categories'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseCategoriesHome.fromJson(jsonDecode(resp.body)).categories;
  }


  Future<List<ListProducts>> allFavoriteProducts() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-all-favorite'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
    );

    return ResponseProductsHome.fromJson(jsonDecode(resp.body)).listProducts;
  }


  Future<List<ListProducts>> getProductsForCategories(String id) async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-products-for-category/'+ id ),
      headers: { 'Content-type'   : 'application/json', 'xxx-token' : token! },
    );

    return ResponseProductsHome.fromJson(jsonDecode(resp.body)).listProducts;
  }


  Future<ResponseDefault> saveOrderBuyProductToDatabase(String receipt, String amount, List<ProductCart> products) async {

    final token = await secureStorage.readToken();

    Map<String, dynamic> data = {
      'receipt' : receipt,
      'amount'  : amount,
      'products': products
    };

    final body = json.encode( data );
    
    final resp = await http.post(Uri.parse('${URLS.urlApi}/product/save-order-buy-product'),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
      body: body
    );

    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }


  Future<ResponseDefault> addNewProduct(String name, String description, String stock, String price, String uidCategory, String image) async {

    final token = await secureStorage.readToken();

    var request = http.MultipartRequest('POST', Uri.parse('${URLS.urlApi}/product/add-new-product'))
      ..headers['Accept'] = 'application/json'
      ..headers['xxx-token'] = token!
      ..fields['name'] = name
      ..fields['description'] = description
      ..fields['stock'] = stock
      ..fields['price'] = price
      ..fields['uidCategory'] = uidCategory
      ..files.add( await http.MultipartFile.fromPath('productImage', image));

    final resp = await request.send();
    var data = await http.Response.fromStream( resp );

    return ResponseDefault.fromJson(jsonDecode(data.body));
  } 


  Future<List<OrderBuy>> getPurchasedProducts() async {

    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse('${URLS.urlApi}/product/get-all-purchased-products'),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
    );
    return ResponseOrderBuy.fromJson(jsonDecode( response.body )).orderBuy;
  }


  Future<List<OrderDetail>> getOrderDetails(String uidOrder) async {

    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse('${URLS.urlApi}/product/get-orders-details/'+ uidOrder),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
    );
    return ResponseOrderDetails.fromJson(jsonDecode( response.body )).orderDetails;
  }


 


  
}

final productServices = ProductServices();