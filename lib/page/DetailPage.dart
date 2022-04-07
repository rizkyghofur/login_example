import 'package:flutter/material.dart';

class DetailScreenPage extends StatefulWidget {
  final int idMenu;

  DetailScreenPage({Key key, this.idMenu}) : super(key: key);

  @override
  _DetailScreenPageState createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Center(child: Text('')));
  }
}
