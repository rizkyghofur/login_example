import 'package:dio/dio.dart';
import 'package:login_example/constants/UrlConstants.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/utils/Injector.dart';

class CRUDRepository {
  final Dio dio = locator<Dio>();

  Future<List<GetDataResponse>> getData() async {
    try {
      Response response = await dio.get(UrlConstants.get_data);

      List<GetDataResponse> fetchedResponse = (response.data as List)
              .map((data) => GetDataResponse.fromJson(data))
              .toList();

      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
