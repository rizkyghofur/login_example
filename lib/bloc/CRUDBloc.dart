import 'package:login_example/model/response/DeleteDataResponse.dart';
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

  Future<UpdateDataResponse> updateData(idMenu, namaMenu, deskripsiMenu, hargaMenu, diskonMenu) async {
    try {
      return crudRepository.updatedata(idMenu, namaMenu, deskripsiMenu, hargaMenu, diskonMenu);
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
}

final crudBloc = CrudBloc();
