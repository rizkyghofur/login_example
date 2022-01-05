import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:login_example/page/DataPage.dart';
import 'package:login_example/page/LoginPage.dart';
import 'package:login_example/utils/Injector.dart';
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
    await isInternetAvailable().then((value) {
      if (value) {
        if (util.isKeyExists(PreferencesUtil.userId)) {
          Timer(
              Duration(seconds: 3),
              () => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return DataScreenPage();
                  })));
        } else {
          Timer(
              Duration(seconds: 3),
              () => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return LoginScreen();
                  })));
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          headerAnimationLoop: false,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Error',
          desc: 'Please check your internet connection',
          buttonsTextStyle: TextStyle(color: Colors.white),
          showCloseIcon: false,
          btnOkColor: Colors.red,
          btnOkOnPress: () {},
        )..show();
      }
    });
  }
}
