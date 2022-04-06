import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_example/page/BottomNavBar.dart';
import 'package:login_example/page/LoginPage.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final PreferencesUtil util = PreferencesUtil();

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: FlutterLogo(size: 100));
  }

  startSplashScreen() async {
    if (util.isKeyExists(PreferencesUtil.userId)) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return BottomNavBar();
              })));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return LoginScreen();
              })));
    }
  }
}
