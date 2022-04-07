import 'package:login_example/model/response/AddDataResponse.dart';
import 'package:login_example/model/response/DeleteDataResponse.dart';
import 'package:login_example/model/response/GetBiodataResponse.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/model/response/UpdateDataResponse.dart';
import 'package:login_example/repository/CRUDRepository.dart';

class CrudBloc {
  CRUDRepository crudRepository = CRUDRepository();

  Future<List<GetDataResponse>> getData() async {
    try {
      return crudRepository.getData();
    } catch (e) {
      return null;
    }
  }

  Future<AddDataResponse> addData(
      item_name, item_code, price, stock, foto_produk) async {
    try {
      return crudRepository.addData(
          item_name, item_code, price, stock, foto_produk);
    } catch (e) {
      return null;
    }
  }

  Future<UpdateDataResponse> updateData(
      id, item_name, item_code, price, stock, foto_produk) async {
    try {
      return crudRepository.updateData(
          id, item_name, item_code, price, stock, foto_produk);
    } catch (e) {
      return null;
    }
  }

  Future<DeleteDataResponse> deleteData(int id) async {
    try {
      return crudRepository.deleteData(id);
    } catch (e) {
      return null;
    }
  }

  Future<GetBiodataResponse> getBioData() async {
    try {
      return crudRepository.getBioData();
    } catch (e) {
      return null;
    }
  }
}

final crudBloc = CrudBloc();
