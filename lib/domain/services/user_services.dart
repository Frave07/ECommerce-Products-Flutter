import 'dart:convert';
import 'package:e_commers/data/env/env.dart';
import 'package:e_commers/data/local_storage/secure_storage.dart';
import 'package:e_commers/domain/models/response/response_default.dart';
import 'package:e_commers/domain/models/response/response_user.dart';
import 'package:http/http.dart' as http;

class UserServices {


  Future<ResponseDefault> addNewUser(String username, String email, String password ) async {

    final resp = await http.post(Uri.parse('${Environment.urlApi}/user/add-new-user'),
      headers: { 'Accept': 'application/json'},
      body: {
        'username': username,
        'email': email,
        'passwordd': password
      }
    );

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }


  Future<User> getUserById() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${Environment.urlApi}/user/get-user-by-id'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );

    return ResponseUser.fromJson(jsonDecode(resp.body)).user;
  }


  Future<ResponseDefault> updatePictureProfile(String image) async {

    final token = await secureStorage.readToken();

    var request = http.MultipartRequest('PUT', Uri.parse('${Environment.urlApi}/user/update-picture-profile'))
      ..headers['Accept'] = 'application/json'
      ..headers['xxx-token'] = token!
      ..files.add( await http.MultipartFile.fromPath('image', image ) );

    final resp = await request.send();
    var data = await http.Response.fromStream( resp );

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }


  Future<ResponseDefault> updateInformationUser(String name, String last, String phone, String address, String reference) async {

    final token = await secureStorage.readToken();

    final resp = await http.put( Uri.parse('${Environment.urlApi}/user/update-information-user'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
      body: {
        'firstname' : name,
        'lastname'  : last,
        'phone'     : phone,
        'address'   : address,
        'reference' : reference
      }
    );

    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }


  Future<ResponseDefault> updateStreetAddress(String address, String reference) async {

    final token = await secureStorage.readToken();

    final resp = await http.put( Uri.parse('${Environment.urlApi}/user/update-street-address'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
      body: {
        'address'   : address,
        'reference' : reference
      }
    );
    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }



}

final userServices = UserServices();