import 'package:flutter/material.dart';

class DetailScreenPage extends StatefulWidget {
  final int idMenu;

  DetailScreenPage({Key key, this.idMenu}) : super(key: key);

  @override
  _DetailScreenPageState createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  String namaMenu = "";

  @override
  void initState() {
    getSelectedMenu();
    super.initState();
  }

  void getSelectedMenu() async {}

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Center(child: Text(namaMenu)));
  }
}
