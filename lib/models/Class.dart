import 'dart:convert';

class Class {
  String name;
  String outline;
  String teacherId;
  num credit;
  List<String> classTime;
  String classRoom;
  bool isLaunched;
  String coverImage;
  String introduction;
  String introVideoUrl;

  Class({
    this.name,
    this.outline,
    this.teacherId,
    this.credit,
    this.classTime,
    this.classRoom,
    this.isLaunched,
    this.coverImage,
    this.introduction,
    this.introVideoUrl,
  });

  factory Class.fromRawJson(String str) => Class.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Class.fromJson(Map<String, dynamic> json) => new Class(
        name: json["name"],
        outline: json["outline"],
        teacherId: json["teacherId"],
        credit: json["credit"],
        classTime: json["classTime"].cast<String>(),
        classRoom: json["classRoom"],
        isLaunched: json["isLaunched"],
        coverImage: json["coverImage"],
        introduction: json["introduction"],
        introVideoUrl: json["introVideoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "outline": outline,
        "teacherId": teacherId,
        "credit": credit,
        "classTime": classTime,
        "classRoom": classRoom,
        "isLaunched": isLaunched,
        "coverImage": coverImage,
        "introduction": introduction,
        "introVideoUrl": introVideoUrl,
      };
}
