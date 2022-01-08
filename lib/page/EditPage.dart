import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/sqliteModel.dart';
import 'package:login_example/page/DataPage.dart';

class EditScreenPage extends StatefulWidget {
  final int id;

  const EditScreenPage({Key key, this.id}) : super(key: key);

  @override
  _EditScreenPageState createState() => _EditScreenPageState();
}

class _EditScreenPageState extends State<EditScreenPage> {
  final _formKey = GlobalKey<FormState>();
  final CrudBloc crudBloc = CrudBloc();
  String newNamaMenu = "";
  String newDeskripsiMenu = "";
  int newHargaMenu = 0;
  int newDiskonMenu = 0;
  bool isSubmit = false;

  @override
  void initState() {
    getSelectedMenu();
    super.initState();
  }

  Future<Menu> getSelectedMenu() async {
    return Menu().select().id_menu.equals(widget.id).toSingle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data from API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Menu>(
          future: getSelectedMenu(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Menu dataMenu = snapshot.data;
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            initialValue: dataMenu.nama_menu,
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
                            initialValue: dataMenu.deskripsi,
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
                            initialValue: dataMenu.harga.toString(),
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
                            initialValue: dataMenu.diskon.toString(),
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
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                          ),
                          onTap: () {
                            setState(() {
                              isSubmit = true;
                            });
                            var idMenu = widget.id;
                            if (_formKey.currentState.validate()) {
                              crudBloc
                                  .updateData(
                                      idMenu,
                                      newNamaMenu,
                                      newDeskripsiMenu,
                                      newHargaMenu,
                                      newDiskonMenu)
                                  .then((value) {
                                if (value.message.contains("success")) {
                                  isSubmit = false;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DataScreenPage(),
                                    ),
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
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
