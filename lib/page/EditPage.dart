import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
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
  String item_name, item_code, price, stock, foto_produk;
  bool isSubmit = false;
  Future<GetDataResponse> _data;

  @override
  void initState() {
    super.initState();
    _data = crudBloc.getDataById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data from API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<GetDataResponse>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var response = snapshot.data;
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
                              initialValue: response.item_name,
                              decoration: new InputDecoration(
                                hintText: "contoh: Lontong",
                                labelText: "Nama Item",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Nama menu tidak boleh kosong';
                                } else {
                                  item_name = value;
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: response.item_code,
                              decoration: new InputDecoration(
                                hintText: "contoh: E421",
                                labelText: "Kode Item",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Kode menu tidak boleh kosong';
                                } else {
                                  item_code = value;
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: response.price,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                hintText: "contoh: 5000",
                                labelText: "Harga Menu",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Harga menu tidak boleh kosong';
                                } else {
                                  price = value;
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: response.stock,
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                hintText: "contoh: 10",
                                labelText: "Stok Item",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Stok menu tidak boleh kosong';
                                } else {
                                  stock = value;
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: "",
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                labelText: "Foto Item",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Foto menu tidak boleh kosong';
                                } else {
                                  foto_produk = value;
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
                              var id = widget.id;
                              if (_formKey.currentState.validate()) {
                                crudBloc
                                    .updateData(id, item_name, item_code, price,
                                        stock, foto_produk)
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
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
