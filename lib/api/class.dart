import 'package:icoding_ap/api/baseApi.dart';
import 'package:icoding_ap/models/ApiResponse.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:dio/dio.dart';
import 'package:icoding_ap/models/StudentTakeCourse.dart';

class ClassRoute extends BaseApi {
  /* 取得所有課程 */
  Future<CustomApiResponse<List<Class>>> getAllClasses() async {
    try {
      var res = await dio.get('/api/class');
      if (res == null) print("null");

      List<Class> classes = [];
      for (var data in res.data) {
        var classData = Class.fromJson(data["classData"]);
        classes.add(classData);
      }
      print("class length = ${classes.length}");
      var result = new CustomApiResponse<List<Class>>(
        true,
        classes,
        null,
      );
      return result;
    } on DioError catch (dioError) {
      return returnError(dioError);
    }
  }

  /* 取得課程內所有學生的修課狀態 */
  Future<CustomApiResponse<List<StudentTakeCourse>>> getStudentStatuseList(
      String classId) async {
    try {
      var res = await dio.get('/api/class/$classId/studentStatusList');
      if (res == null) print("null");

      List<StudentTakeCourse> statuses = [];
      for (var data in res.data) {
        var status = StudentTakeCourse.fromJson(data["classData"]);
        statuses.add(status);
      }
      var result = new CustomApiResponse<List<StudentTakeCourse>>(
        true,
        statuses,
        null,
      );
      return result;
    } on DioError catch (dioError) {
      return returnError(dioError);
    }
  }
}
