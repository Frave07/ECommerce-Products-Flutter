import 'package:e_commers/presentation/screen/login/loading_page.dart';
import 'package:e_commers/presentation/screen/login/login_page.dart';
import 'package:e_commers/presentation/screen/login/register_page.dart';
import 'package:e_commers/presentation/screen/start/start_home_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {

    'loadingPage'   : ( context ) => LoadingPage(),
    'getStarted'    : ( context ) => StartHomePage(),
    'signInPage'    : ( context ) => SignInPage(),
    'signUpPage'    : ( context ) => SignUpPage(),
    // 'homePage'      : ( context ) => HomePage(),
    // 'cartPage'      : ( context ) => CartPage(),
    // 'favoritePage'  : ( context ) => FavoritePage(),
    // 'profilePage'   : ( context ) => ProfilePage(),
};