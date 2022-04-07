import 'package:dio/dio.dart';
import 'package:login_example/constants/UrlConstants.dart';
import 'package:login_example/model/request/AddDataRequest.dart';
import 'package:login_example/model/request/UpdateDataRequest.dart';
import 'package:login_example/model/response/AddDataResponse.dart';
import 'package:login_example/model/response/DeleteDataResponse.dart';
import 'package:login_example/model/response/GetBiodataResponse.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/model/response/UpdateDataResponse.dart';
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

  Future<AddDataResponse> addData(
      item_name, item_code, price, stock, foto_produk) async {
    try {
      AddDataRequest request = new AddDataRequest();
      request.item_name = item_name;
      request.item_code = item_code;
      request.price = price;
      request.stock = stock;
      request.foto_produk = foto_produk;

      dio.options.contentType = "application/x-www-form-urlencoded";
      Response response =
          await dio.post(UrlConstants.add_data, data: request.toJson());
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = AddDataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<UpdateDataResponse> updateData(
      id, item_name, item_code, price, stock, foto_produk) async {
    try {
      UpdateDataRequest request = new UpdateDataRequest();
      request.item_name = item_name;
      request.item_code = item_code;
      request.price = price;
      request.stock = stock;
      request.foto_produk = foto_produk;

      dio.options.contentType = "application/x-www-form-urlencoded";
      Response response = await dio.post(
          UrlConstants.update_data + id.toString(),
          data: request.toJson());
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = UpdateDataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DeleteDataResponse> deleteData(int idMenu) async {
    try {
      Response response =
          await dio.post(UrlConstants.delete_data + idMenu.toString());
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = DeleteDataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<GetBiodataResponse> getBioData() async {
    try {
      Response response = await dio.get(UrlConstants.getBiodata);
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = GetBiodataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
