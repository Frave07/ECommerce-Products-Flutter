import 'dart:convert';

PersonalInformationResponse personalInformationResponseFromJson(String str) => PersonalInformationResponse.fromJson(json.decode(str));

String personalInformationResponseToJson(PersonalInformationResponse data) => json.encode(data.toJson());

class PersonalInformationResponse 
{
    bool resp;
    String msj;
    Information information;

    PersonalInformationResponse({
        this.resp,
        this.msj,
        this.information,
    });

    factory PersonalInformationResponse.fromJson(Map<String, dynamic> json) => PersonalInformationResponse(
        resp: json["resp"],
        msj: json["msj"],
        information: Information.fromJson(json["information"]),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "information": information.toJson(),
    };
}

class Information {
    
    String firstName;
    dynamic lastName;
    dynamic phone;
    dynamic address;
    dynamic reference;
    
    Information({
        this.firstName,
        this.lastName,
        this.phone,
        this.address,
        this.reference,
    });

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        address: json["address"],
        reference: json["reference"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "address": address,
        "reference": reference,
    };
}
