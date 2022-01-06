import 'package:dio/dio.dart';
import 'package:login_example/constants/UrlConstants.dart';
import 'package:login_example/model/response/DeleteDataResponse.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/model/sqliteModel.dart';
import 'package:login_example/utils/Injector.dart';

class CRUDRepository {
  final Dio dio = locator<Dio>();

  Future<List<GetDataResponse>> getData() async {
    try {
      Response response = await dio.get(UrlConstants.get_data);

      List<GetDataResponse> fetchedResponse = (response.data as List)
          .map((data) => GetDataResponse.fromJson(data))
          .toList();

      for (GetDataResponse response in fetchedResponse) {
        await Menu()
            .select()
            .id_menu
            .equals(response.id)
            .toSingle()
            .then((Menu menuData) {
          if (menuData == null) {
            Menu newMenu = new Menu();
            newMenu.id_menu = response.id;
            newMenu.nama_menu = response.nama_menu;
            newMenu.foto_menu = response.foto_menu;
            newMenu.jenis_menu = response.jenis;
            newMenu.deskripsi = response.deskripsi_menu;
            newMenu.harga = response.harga;
            newMenu.diskon = response.diskon;
            newMenu.save();
          } else {
            menuData.id_menu = response.id;
            menuData.nama_menu = response.nama_menu;
            menuData.foto_menu = response.foto_menu;
            menuData.jenis_menu = response.jenis;
            menuData.deskripsi = response.deskripsi_menu;
            menuData.harga = response.harga;
            menuData.diskon = response.diskon;
            menuData.save();
          }
        });
      }

      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<DeleteDataResponse> deleteData(int idMenu) async {
    try {
      Response response = await dio.post(UrlConstants.delete_data + idMenu.toString());
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = DeleteDataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
