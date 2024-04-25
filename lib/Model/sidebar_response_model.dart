// To parse this JSON data, do
//
//     final sidebarResponseApiModel = sidebarResponseApiModelFromJson(jsonString);

import 'dart:convert';

SidebarResponseApiModel sidebarResponseApiModelFromJson(String str) => SidebarResponseApiModel.fromJson(json.decode(str));

String sidebarResponseApiModelToJson(SidebarResponseApiModel data) => json.encode(data.toJson());
class SidebarResponseApiModel {
  final int? code;
  final bool? success;
  final String? status;
  final List<Datum>? data;

  SidebarResponseApiModel({
    this.code,
    this.success,
    this.status,
    this.data,
  });

  factory SidebarResponseApiModel.fromJson(Map<String, dynamic> json) => SidebarResponseApiModel(
    code: json["code"],
    success: json["success"],
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? id;
  final String? icon;
  final int? order;
  final String? englishName;
  final String? malayalamName;
  final int? status;
  final List<Datum>? subMenu;
  final String? mainId;

  Datum({
    this.id,
    this.icon,
    this.order,
    this.englishName,
    this.malayalamName,
    this.status,
    this.subMenu,
    this.mainId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    icon: json["icon"],
    order: json["order"],
    englishName: json["english_name"],
    malayalamName: json["malayalam_name"],
    status: json["status"],
    subMenu: json["sub_menu"] == null ? [] : List<Datum>.from(json["sub_menu"]!.map((x) => Datum.fromJson(x))),
    mainId: json["main_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "icon": icon,
    "order": order,
    "english_name": englishName,
    "malayalam_name": malayalamName,
    "status": status,
    "sub_menu": subMenu == null ? [] : List<dynamic>.from(subMenu!.map((x) => x.toJson())),
    "main_id": mainId,
  };
}
