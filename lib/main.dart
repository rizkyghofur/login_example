import 'package:flutter/material.dart';
import 'package:login_example/page/LoginPage.dart';
import 'package:login_example/utils/Injector.dart';
import 'constants/Constants.dart';
import 'model/sqliteModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();

  final bool isInitialized = await AppDBModel().initializeDB();
  if (isInitialized) {
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
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
