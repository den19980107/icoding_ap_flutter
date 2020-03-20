import 'dart:convert';

class ApiResponse {
  bool isSuccess;
  dynamic data;
  Errors errors;

  ApiResponse({
    this.isSuccess,
    this.data,
    this.errors,
  });
}

class CustomApiResponse<T> {
  bool isSuccess;
  final T data;
  Errors errors;

  CustomApiResponse(
    this.isSuccess,
    this.data,
    this.errors,
  );
}

class Errors {
  List<ErrorMessage> messages;
  Errors(this.messages);

  factory Errors.fromRawJson(String str) => Errors.fromJson(json.decode(str));
  factory Errors.fromJson(Map<String, dynamic> json) => new Errors(
        json["errors"],
      );
}

class ErrorMessage {
  String msg;
  ErrorMessage(this.msg);

  factory ErrorMessage.fromRawJson(String str) =>
      ErrorMessage.fromJson(json.decode(str));
  factory ErrorMessage.fromJson(Map<String, dynamic> json) => new ErrorMessage(
        json["msg"],
      );
}
