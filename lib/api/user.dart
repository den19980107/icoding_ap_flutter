import 'package:icoding_ap/api/baseApi.dart';
import 'package:icoding_ap/models/ApiResponse.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:dio/dio.dart';

class UserRoute extends BaseApi {
  Future<CustomApiResponse<List<Class>>> getMyStudyClass(String userId) async {
    try {
      var response = await dio.get("/api/user/myStudyClass/$userId");
      if (response == null) print("null");

      var jsonClasses = response.data;
      List<Class> classes = [];
      for (var jsonClass in jsonClasses) {
        var classInfo = new Class.fromJson(jsonClass);
        classes.add(classInfo);
      }
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

  Future<CustomApiResponse<List<Class>>> getMyClass(String userId) async {
    try {
      var response = await dio.get("/api/user/myClass/$userId");
      if (response == null) print("null");
      var jsonClasses = response.data;
      List<Class> classes = [];
      for (var jsonClass in jsonClasses) {
        var classInfo = new Class.fromJson(jsonClass);
        classes.add(classInfo);
      }
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
}
