import 'dart:math';
import 'package:login_example/model/response/LoginResponse.dart';
import 'package:login_example/model/sqliteModel.dart';
import 'package:login_example/repository/LoginRepository.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class LoginBloc {
  LoginRepository loginRepository = LoginRepository();
  PreferencesUtil util = PreferencesUtil();
  
  Future<LoginResponse> getLogin(String username, String password) async {
    try {
      LoginResponse response = await loginRepository.getLogin(username, password);
      var randomId = new Random();
      if (response.success == "1") {
        util.putString(PreferencesUtil.userId, response.id);
        util.putString(PreferencesUtil.name, response.username);
        await Pengguna().select().toSingle().then((Pengguna user) async {
          if (user == null) {
            await Pengguna(
                id: randomId.nextInt(5000),
                id_pengguna: response.id,
                nama_pengguna: response.username,
                role: response.role)
                .save();
          }
        });
      }
      // return response;
      return loginRepository.getLogin(username, password);
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
}

final loginBloc = LoginBloc();
