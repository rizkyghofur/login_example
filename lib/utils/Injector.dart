import 'dart:io';
import 'package:dio/dio.dart';
import 'package:login_example/interceptors/LoggingInterceptors.dart';
import 'package:get_it/get_it.dart';
import 'SharedPrefs.dart';

GetIt locator = GetIt.instance;

Future baseDio() async {
  final options = BaseOptions(
    connectTimeout: 300000,
    receiveTimeout: 300000,
  );

  var dio = Dio(options);

  dio.interceptors.add(LoggingInterceptors());

  locator.registerSingleton<Dio>(dio);
}

Future setupLocator() async {
  PreferencesUtil util = await PreferencesUtil.getInstance();
  locator.registerSingleton<PreferencesUtil>(util);
}

Future<bool> isInternetAvailable() async {
  bool isInternetAvailable = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      isInternetAvailable = true;
    } else {
      isInternetAvailable = false;
    }
  } catch (e) {
    isInternetAvailable = false;
  }
  return isInternetAvailable;
}
