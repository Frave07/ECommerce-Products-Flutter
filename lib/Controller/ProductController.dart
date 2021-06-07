import 'dart:convert';
import 'package:e_commers/Models/Home/ProductsHome.dart';
import 'package:e_commers/Models/Product.dart';
import 'package:e_commers/Models/Product/FavoriteProduct.dart';
import 'package:e_commers/Models/Response/PurchasedProductsResponse.dart';
import 'package:http/http.dart' as http;
import 'package:e_commers/Controller/AuthController.dart';
import 'package:e_commers/Models/ResponseModels.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductController
{

  String server = 'http://192.168.1.16:7070/api';
  final secureStorage = FlutterSecureStorage();
  

  Future<ResponseModels> addOrDeleteProductFavorite({ String uidProduct }) async {

      final token = await authController.readToken();

      final resp = await http.post(Uri.parse('$server/add-Favorite-Product'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token },
        body: {
          'uidProduct' : uidProduct,
          'uidUser'    : await secureStorage.read(key: 'uid')
        }
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
  }

  Future<List<Favorite>> favoriteProducts() async {

      final token = await authController.readToken();

      final resp = await http.get(Uri.parse('$server/product-favorite-for-user'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token },
      );

      return FavoriteProduct.fromJson( jsonDecode( resp.body ) ).favorites;
  }


  Future<ResponseModels> saveOrderBuyProduct({ String receipt, String date, String amount, List<ProductCart> products }) async {

      final token = await authController.readToken();

      Map<String, dynamic> data = {
        'receipt' : receipt,
        'date'    : date,
        'amount'  : amount,
        'products': products
      };

      final body = json.encode( data );
      
      final resp = await http.post(Uri.parse('$server/save-order-products'),
        headers: { 'Content-type' : 'application/json', 'xx-token' : token },
        body: body
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
  }


  Future<PurchasedProductsResponse> getPurchasedProducts() async {

      final token = await authController.readToken();

      final response = await http.get(Uri.parse('$server/get-purchased-products'),
        headers: { 'Content-type'   : 'application/json', 'xx-token' : token },
      );

      return PurchasedProductsResponse.fromJson( jsonDecode( response.body ) );
  }


  Future<List<Product>> getProductsForCategories({ String id }) async {

    final token = await authController.readToken();

      final response = await http.get(Uri.parse('$server/get-products-for-categories/'+ id ),
        headers: { 'Content-type'   : 'application/json', 'xx-token' : token },
      );

    return ProductsHome.fromJson( jsonDecode( response.body ) ).products;

  }



}

final dbProductController = ProductController();