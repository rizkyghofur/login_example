import '../LoadAPIStatus.dart';

class BaseResponse<T> {
  String status;
  String success;
  String message;
  String error;
  List<T> data;
  LoadApiStatus loadStatus;

  BaseResponse(
      {this.status, this.success, this.message, this.data, this.error});

  BaseResponse.loading(this.message) : loadStatus = LoadApiStatus.LOADING;
  BaseResponse.completed(this.data) : loadStatus = LoadApiStatus.COMPLETED;
  BaseResponse.error(this.message) : loadStatus = LoadApiStatus.ERROR;

  factory BaseResponse.fromJson(
      Map<String, dynamic> jsonData, Function fromJson) {
    final items = jsonData['data'];

    List<T> output = [];

    if (items != null) {
      if (items is Iterable) {
        for (Map<String, dynamic> json in items) {
          output.add(fromJson(json));
        }
      } else {
        output.add(fromJson(items));
      }
    }

    return BaseResponse<T>(
      status: jsonData["status"],
      success: jsonData["success"],
      message: jsonData["message"],
      data: output,
    );
  }

  BaseResponse.withError(String errorValue)
      : status = "",
        success = "",
        message = "",
        data = [],
        error = errorValue;
}
