import 'package:login_example/model/response/LoginResponse.dart';
import 'package:login_example/model/response/RegisterResponse.dart';
import 'package:login_example/repository/AuthRepository.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class AuthBloc {
  AuthRepository authRepository = AuthRepository();
  PreferencesUtil util = PreferencesUtil();

  Future<LoginResponse> getLogin(String username, String password) async {
    try {
      LoginResponse response =
          await authRepository.getLogin(username, password);
      util.putString(PreferencesUtil.name, response.data.name);
      util.putString(PreferencesUtil.userId, response.data.id.toString());
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse> getRegister(
      String nama, String email, String password) async {
    try {
      return authRepository.register(nama, email, password);
    } catch (e) {
      return null;
    }
  }

  Future<bool> logout() {
    try {
      return util.clearAll();
    } catch (e) {
      return null;
    }
  }

  // Future<OngkirResponse> getOngkirFromUserLocation(String latitude, String longitude) async {
  //   try {
  //     return repository.getOngkir(latitude, longitude);
  //   } catch (e){
  //     return null;
  //   }
  // }

  // Future<BaseResponse<LoginResponse>> getLogin(
  //     String username, String password) async {
  //   try {
  //     BaseResponse<LoginResponse> response =
  //         await authRepository.getLogin(username, password);
  //     var randomId = new Random();
  //     if (response.message == "1") {
  //       print("jenengmu: " + response.data[0].nama);
  //       util.putString(PreferencesUtil.name, response.data[0].nama);
  //       await Pengguna().select().toSingle().then((user) async {
  //         if (user == null) {
  //           await Pengguna(
  //                   id: randomId.nextInt(5000),
  //                   id_pengguna: response.data[0].id.toString(),
  //                   nama_pengguna: response.data[0].nama,
  //                   role: response.data[0].role)
  //               .save();
  //         }
  //       });
  //     }
  //     return response;
  //     //return authRepository.getLogin(username, password);
  //   } catch (e) {
  //     return null;
  //   }
  // }
}

final loginBloc = AuthBloc();
