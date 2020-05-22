// To parse this JSON data, do
//
//     final sectormodel = sectormodelFromJson(jsonString);

import 'dart:convert';

Sectormodel sectormodelFromJson(String str) => Sectormodel.fromJson(json.decode(str));

String sectormodelToJson(Sectormodel data) => json.encode(data.toJson());

class Sectormodel {
    Result result;

    Sectormodel({
        this.result,
    });

    factory Sectormodel.fromJson(Map<String, dynamic> json) => Sectormodel(
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
    List<Sector> sectors;

    RespData({
        this.sectors,
    });

    factory RespData.fromJson(Map<String, dynamic> json) => RespData(
        sectors: List<Sector>.from(json["sectors"].map((x) => Sector.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sectors": List<dynamic>.from(sectors.map((x) => x.toJson())),
    };
}

class Sector {
    String sectorId;
    String name;

    Sector({
        this.sectorId,
        this.name,
    });

    factory Sector.fromJson(Map<String, dynamic> json) => Sector(
        sectorId: json["sectorId"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "sectorId": sectorId,
        "name": name,
    };
}
