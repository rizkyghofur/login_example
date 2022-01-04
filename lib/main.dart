import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login_example/page/SplashScreenPage.dart';
import 'package:login_example/utils/Injector.dart';
import 'constants/Constants.dart';
import 'model/sqliteModel.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();

  final bool isInitialized = await AppDBModel().initializeDB();
  if (isInitialized) {
    HttpOverrides.global = new MyHttpoverrides();
    runApp(
      MyApp(),
    );
  } else {
    debugPrint("fail to init db");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
