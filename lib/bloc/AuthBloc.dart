import 'dart:math';
import 'package:login_example/model/response/LoginResponse.dart';
import 'package:login_example/model/response/RegisterResponse.dart';
import 'package:login_example/model/sqliteModel.dart';
import 'package:login_example/repository/AuthRepository.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class AuthBloc {
  AuthRepository authRepository = AuthRepository();
  PreferencesUtil util = PreferencesUtil();

  Future<LoginResponse> getLogin(String username, String password) async {
    try {
      LoginResponse response =
          await authRepository.getLogin(username, password);
      var randomId = new Random();
      util.putString(PreferencesUtil.name, response.nama);
      util.putString(PreferencesUtil.userId, response.id.toString());
      util.putString(PreferencesUtil.role, response.role);
      if (response.success == "1") {
        await Pengguna().select().toSingle().then((user) async {
          if (user == null) {
            await Pengguna(
                    id: randomId.nextInt(5000),
                    id_pengguna: response.id.toString(),
                    nama_pengguna: response.nama,
                    role: response.role)
                .save();
          }
        });
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse> getRegister(
      String nama, String email, String notelp, String password) async {
    try {
      return authRepository.register(nama, email, notelp, password);
      // return loginRepository.getLogin(username, password);
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
