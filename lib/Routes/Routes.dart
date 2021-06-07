import 'package:e_commers/Views/Cart/CartPage.dart';
import 'package:e_commers/Views/Favorite/FavoritePage.dart';
import 'package:e_commers/Views/Start/HomeScreenPage.dart';
import 'package:e_commers/Views/Home/HomePage.dart';
import 'package:e_commers/Views/Login/LoadingPage.dart';
import 'package:e_commers/Views/Login/SignInPage.dart';
import 'package:e_commers/Views/Login/SignupPage.dart';
import 'package:e_commers/Views/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {

    'loadingPage'   : ( context ) => LoadingPage(),
    'getStarted'    : ( context ) => HomeScreenPage(),
    'signInPage'    : ( context ) => SignInPage(),
    'signUpPage'    : ( context ) => SignUpPage(),
    'homePage'      : ( context ) => HomePage(),
    'cartPage'      : ( context ) => CartPage(),
    'favoritePage'  : ( context ) => FavoritePage(),
    'profilePage'   : ( context ) => ProfilePage(),
};