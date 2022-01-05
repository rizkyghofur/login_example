import 'package:login_example/model/response/GetDataResponse.dart';
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
}

final crudBloc = CrudBloc();
