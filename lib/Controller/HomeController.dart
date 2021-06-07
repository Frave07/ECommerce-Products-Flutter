import 'dart:convert';
import 'package:e_commers/Models/Home/ProductsHome.dart';
import 'package:http/http.dart' as http;
import 'package:e_commers/Controller/AuthController.dart';
import 'package:e_commers/Models/Home/HomeCarousel.dart';
import 'package:e_commers/Models/Home/CategoriesProducts.dart';


class HomeController {

    String server = 'http://192.168.1.16:7070/api';


    Future<List<SliderHome>> getHomeCarouselSlider() async {

        final token = await authController.readToken();

        final resp = await http.get(Uri.parse('$server/home-carousel'),
          headers: {
            'Accept'   : 'application/json',
            'xx-token' : token
          }
        );

        return HomeCarousel.fromJson( jsonDecode( resp.body )).slider;
    }


    Future<List<Category>> getListCategoriesProducts() async {

        final token = await authController.readToken();

        final resp = await http.get(Uri.parse('$server/list-categories'),
          headers: {
            'Accept'   : 'application/json',
            'xx-token' : token
          }
        );

        return CategoriesProducts.fromJson( jsonDecode( resp.body )).categories;
    }


    Future<List<Product>> getListProductsHome() async {

        final token = await authController.readToken();

        final resp = await http.get(Uri.parse('$server/list-products-home'),
          headers: {
            'Accept'   : 'application/json',
            'xx-token' : token
          }
        );

        return ProductsHome.fromJson( jsonDecode( resp.body ) ).products;
    }


    Future<List<Category>> getListCategories() async {

      final token = await authController.readToken();

        final resp = await http.get(Uri.parse('$server/list-categories-all'),
          headers: {
            'Accept'   : 'application/json',
            'xx-token' : token
          }
        );

        return CategoriesProducts.fromJson( jsonDecode( resp.body )).categories;

    }



}

final dbHomeController = HomeController();