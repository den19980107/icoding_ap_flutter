import 'package:dio/dio.dart';
import 'package:icoding_ap/config/constants.dart';
import 'package:icoding_ap/models/ApiResponse.dart';

class BaseApi {
  static const String HOST = Constants.API_HOST;
  final Dio dio = Dio(BaseOptions(
    baseUrl: HOST,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  ));

  CustomApiResponse<dynamic> returnError(DioError dioError) {
    Errors errors = new Errors([]);
    for (var error in dioError.response.data["errors"]) {
      ErrorMessage errorMessage = ErrorMessage.fromJson(error);
      errors.messages.add(errorMessage);
    }
    var result = new CustomApiResponse(
      false,
      null,
      errors,
    );
    return result;
  }
}
