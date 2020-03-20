import 'package:icoding_ap/api/baseApi.dart';
import 'package:icoding_ap/models/ApiResponse.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:dio/dio.dart';

class ClassRoute extends BaseApi {
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
}
