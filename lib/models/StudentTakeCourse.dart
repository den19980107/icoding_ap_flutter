import 'dart:convert';

class StudentTakeCourseStatus {
  static const notTake = "notTake";
  static const inProgress = "inProgress";
  static const alreadyIn = "alreadyIn";
  static const quit = "quit";
}

class StudentTakeCourse {
  String studentId;
  String classId;
  String status;
  bool isIn;

  StudentTakeCourse({this.studentId, this.classId, this.status, this.isIn});

  factory StudentTakeCourse.fromRawJson(String str) =>
      StudentTakeCourse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentTakeCourse.fromJson(Map<String, dynamic> json) =>
      new StudentTakeCourse(
        studentId: json["studentId"],
        classId: json["classId"],
        status: json["status"],
        isIn: json["isIn"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "classId": classId,
        "status": status,
        "isIn": isIn
      };
}
