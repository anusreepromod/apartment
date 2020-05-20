// To parse this JSON data, do
//
//     final announcementmodel = announcementmodelFromJson(jsonString);

import 'dart:convert';

Announcementmodel announcementmodelFromJson(String str) => Announcementmodel.fromJson(json.decode(str));

String announcementmodelToJson(Announcementmodel data) => json.encode(data.toJson());

class Announcementmodel {
    Result result;

    Announcementmodel({
        this.result,
    });

    factory Announcementmodel.fromJson(Map<String, dynamic> json) => Announcementmodel(
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
    List<Announcement> announcements;

    RespData({
        this.announcements,
    });

    factory RespData.fromJson(Map<String, dynamic> json) => RespData(
        announcements: List<Announcement>.from(json["announcements"].map((x) => Announcement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "announcements": List<dynamic>.from(announcements.map((x) => x.toJson())),
    };
}

class Announcement {
    String id;
    String title;
    String description;
    DateTime createdTime;

    Announcement({
        this.id,
        this.title,
        this.description,
        this.createdTime,
    });

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdTime: DateTime.parse(json["created_time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_time": createdTime.toIso8601String(),
    };
}
