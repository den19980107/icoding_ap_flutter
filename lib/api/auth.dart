import 'package:icoding_ap/api/baseApi.dart';
import 'package:icoding_ap/models/ApiResponse.dart';
import 'package:icoding_ap/models/User.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class AuthService extends BaseApi {
  Future<CustomApiResponse<UserInfo>> login(
      String username, String password) async {
    try {
      var response = await dio.post(
        '/api/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response == null) print('null');
      var user = UserInfo.fromJson(response.data["user"]);
      return new CustomApiResponse(
        response.statusCode == 200,
        user,
        null,
      );
    } on DioError catch (dioError) {
      print(dioError.response.data["error"]);
      // throw dioError;
      return null;
    }
  }

  Future<CustomApiResponse<UserInfo>> loginWithThirdparty(
      String accountType, String accountId) async {
    try {
      var response = await dio.post(
        '/api/auth/app/thirdParty',
        data: {
          'accountType': accountType,
          'accountId': accountId,
        },
      );
      if (response == null) print('null');
      var user = UserInfo.fromJson(response.data);

      return new CustomApiResponse(
        response.statusCode == 200,
        user,
        null,
      );
    } on DioError catch (dioError) {
      return returnError(dioError);
    }
  }

  Future<CustomApiResponse<String>> register(String displayName, String email,
      String username, String password, String password2) async {
    try {
      var response = await dio.post(
        '/api/auth/register',
        data: {
          'displayName': displayName,
          'email': email,
          'username': username,
          'password': password,
          'password2': password2,
        },
      );
      if (response == null) print('null');
      var result = new CustomApiResponse(
        response.statusCode == 200,
        response.data["message"],
        null,
      );
      return result;
    } on DioError catch (dioError) {
      return returnError(dioError);
    }
  }
}
