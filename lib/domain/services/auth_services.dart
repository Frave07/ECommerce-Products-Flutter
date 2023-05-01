import 'dart:convert';
import 'package:e_commers/data/env/env.dart';
import 'package:e_commers/data/local_storage/secure_storage.dart';
import 'package:e_commers/domain/models/response/response_auth.dart';
import 'package:http/http.dart' as http;


class AuthServices {

  
  Future<ResponseAuth> login({ required String email, required String password }) async {

    final resp = await http.post(Uri.parse('${Environment.urlApi}/auth/login'),
      headers: { 'Accept' : 'application/json' },
      body: {
        'email' : email,
        'passwordd' : password
      }
    );

    return ResponseAuth.fromJson( jsonDecode( resp.body ) );
  }


  Future<ResponseAuth> renewToken() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${Environment.urlApi}/auth/renew-login'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token!}
    );

    return ResponseAuth.fromJson( jsonDecode( resp.body ) );
  }


}


final authServices = AuthServices();