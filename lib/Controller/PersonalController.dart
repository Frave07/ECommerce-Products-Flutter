import 'dart:convert';
import 'package:e_commers/Models/Response/PersonalInformationResponse.dart';
import 'package:http/http.dart' as http;
import 'package:e_commers/Controller/AuthController.dart';
import 'package:e_commers/Models/ResponseModels.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class PersonalController 
{

    String server = 'http://192.168.1.16:7070/api';

    final secureStorage = FlutterSecureStorage();


    Future<PersonalInformationResponse> getPersonalInformation() async {

        final token = await authController.readToken();

        final resp = await http.get(Uri.parse('$server/get-personal-information'),
          headers: { 'Accept'   : 'application/json', 'xx-token' : token }
        );

        return PersonalInformationResponse.fromJson( jsonDecode( resp.body ) );
    }


    Future<ResponseModels> registerPersonalInformation({ String name, String last, String phone, String address, String reference }) async {

      final token = await authController.readToken();

      final resp = await http.put( Uri.parse('$server/personal/register'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token },
        body: {
          'name'      : name,
          'lastname'  : last,
          'phone'     : phone,
          'address'   : address,
          'reference' : reference
        }
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
    }


    Future<ResponseModels> addStreetAddress({  String address, String reference }) async {

      final token = await authController.readToken();

      final resp = await http.put( Uri.parse('$server/update-street-address'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token },
        body: {
          'address'   : address,
          'reference' : reference
        }
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
    }

    
}

final personalController = PersonalController();