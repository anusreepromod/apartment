// To parse this JSON data, do
//
//     final registrationsuccessmodel = registrationsuccessmodelFromJson(jsonString);

import 'dart:convert';

Registrationsuccessmodel registrationsuccessmodelFromJson(String str) => Registrationsuccessmodel.fromJson(json.decode(str));

String registrationsuccessmodelToJson(Registrationsuccessmodel data) => json.encode(data.toJson());

class Registrationsuccessmodel {
    Result result;

    Registrationsuccessmodel({
        this.result,
    });

    factory Registrationsuccessmodel.fromJson(Map<String, dynamic> json) => Registrationsuccessmodel(
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
    };
}

class Result {
    String apiCode;
    String appVersion;
    String apistatus;
    RespData respData;

    Result({
        this.apiCode,
        this.appVersion,
        this.apistatus,
        this.respData,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        apiCode: json["apiCode"],
        appVersion: json["appVersion"],
        apistatus: json["apistatus"],
        respData: RespData.fromJson(json["resp_data"]),
    );

    Map<String, dynamic> toJson() => {
        "apiCode": apiCode,
        "appVersion": appVersion,
        "apistatus": apistatus,
        "resp_data": respData.toJson(),
    };
}

class RespData {
    UserData userData;

    RespData({
        this.userData,
    });

    factory RespData.fromJson(Map<String, dynamic> json) => RespData(
        userData: UserData.fromJson(json["user_data"]),
    );

    Map<String, dynamic> toJson() => {
        "user_data": userData.toJson(),
    };
}

class UserData {
    String regId;
    String sectorId;
    String plotId;
    String name;
    String email;
    String password;
    String mobile;
    String regType;
    String address;
    String regStatus;
    DateTime createdTime;

    UserData({
        this.regId,
        this.sectorId,
        this.plotId,
        this.name,
        this.email,
        this.password,
        this.mobile,
        this.regType,
        this.address,
        this.regStatus,
        this.createdTime,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        regId: json["regId"],
        sectorId: json["sectorId"],
        plotId: json["plotId"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        regType: json["regType"],
        address: json["address"],
        regStatus: json["regStatus"],
        createdTime: DateTime.parse(json["created_time"]),
    );

    Map<String, dynamic> toJson() => {
        "regId": regId,
        "sectorId": sectorId,
        "plotId": plotId,
        "name": name,
        "email": email,
        "password": password,
        "mobile": mobile,
        "regType": regType,
        "address": address,
        "regStatus": regStatus,
        "created_time": createdTime.toIso8601String(),
    };
}
