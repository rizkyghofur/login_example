import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/page/DataPage.dart';

class AddDataScreenPage extends StatefulWidget {
  const AddDataScreenPage({Key key}) : super(key: key);

  @override
  _AddDataScreenPageState createState() => _AddDataScreenPageState();
}

class _AddDataScreenPageState extends State<AddDataScreenPage> {
  final _formKey = GlobalKey<FormState>();
  final CrudBloc crudBloc = CrudBloc();
  bool isSubmit = false;
  String newNamaMenu;
  String newDeskripsiMenu;
  int newHargaMenu;
  int newDiskonMenu;
  String newJenisMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data from API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: Lontong",
                      labelText: "Nama Menu",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nama menu tidak boleh kosong';
                      } else {
                        newNamaMenu = value;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: Lontong ini enak lho",
                      labelText: "Deskripsi Menu",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Deskripsi menu tidak boleh kosong';
                      } else {
                        newDeskripsiMenu = value;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "contoh: 5000",
                      labelText: "Harga Menu",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Harga menu tidak boleh kosong';
                      } else {
                        newHargaMenu = int.parse(value);
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "contoh: 10 (dalam persen)",
                      labelText: "Diskon Menu",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Diskon menu tidak boleh kosong';
                      } else {
                        newDiskonMenu = int.parse(value);
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "contoh: Makanan",
                      labelText: "Jenis Menu",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Jenis menu tidak boleh kosong';
                      } else {
                        newJenisMenu = value;
                      }
                      return null;
                    },
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff14279B),
                          Color(0xff14279B),
                        ],
                      ),
                    ),
                    child: isSubmit
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            'Change',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      isSubmit = true;
                    });
                    if (_formKey.currentState.validate()) {
                      crudBloc
                          .addData(newNamaMenu, newDeskripsiMenu, newHargaMenu,
                              newDiskonMenu, newJenisMenu)
                          .then((value) {
                        if (value.message.contains("success")) {
                          isSubmit = false;
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DataScreenPage(),
                            ),
                            (route) => false,
                          );
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
