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

  Future<AddDataResponse> addData(namaMenu, deskripsiMenu, hargaMenu, diskonMenu, jenisMenu) async {
    try {
      return crudRepository.addData(namaMenu, deskripsiMenu, hargaMenu, diskonMenu, jenisMenu);
    } catch (e) {
      return null;
    }
  }

  Future<UpdateDataResponse> updateData(idMenu, namaMenu, deskripsiMenu, hargaMenu, diskonMenu) async {
    try {
      return crudRepository.updateData(idMenu, namaMenu, deskripsiMenu, hargaMenu, diskonMenu);
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
