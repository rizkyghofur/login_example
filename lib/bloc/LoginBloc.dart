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
      LoginResponse response =
          await loginRepository.getLogin(username, password);
      var randomId = new Random();
      util.putString(PreferencesUtil.name, response.token);
      if (response.token != null) {
        await Pengguna().select().toSingle().then((user) async {
          if (user == null) {
            await Pengguna(
                    id: randomId.nextInt(5000), id_pengguna: response.token)
                .save();
          }
        });
      }
      return response;
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
}

final loginBloc = LoginBloc();
