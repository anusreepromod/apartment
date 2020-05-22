// To parse this JSON data, do
//
//     final plotmodel = plotmodelFromJson(jsonString);

import 'dart:convert';

Plotmodel plotmodelFromJson(String str) => Plotmodel.fromJson(json.decode(str));

String plotmodelToJson(Plotmodel data) => json.encode(data.toJson());

class Plotmodel {
    Result result;

    Plotmodel({
        this.result,
    });

    factory Plotmodel.fromJson(Map<String, dynamic> json) => Plotmodel(
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
    List<Plot> plots;

    RespData({
        this.plots,
    });

    factory RespData.fromJson(Map<String, dynamic> json) => RespData(
        plots: List<Plot>.from(json["plots"].map((x) => Plot.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "plots": List<dynamic>.from(plots.map((x) => x.toJson())),
    };
}

class Plot {
    String plotId;
    String sectorId;
    String plotNo;

    Plot({
        this.plotId,
        this.sectorId,
        this.plotNo,
    });

    factory Plot.fromJson(Map<String, dynamic> json) => Plot(
        plotId: json["plotId"],
        sectorId: json["sectorId"],
        plotNo: json["plotNo"],
    );

    Map<String, dynamic> toJson() => {
        "plotId": plotId,
        "sectorId": sectorId,
        "plotNo": plotNo,
    };
}
