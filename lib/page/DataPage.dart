import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_example/bloc/AuthBloc.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/page/AddDataPage.dart';
import 'package:login_example/page/DetailPage.dart';
import 'package:login_example/page/EditPage.dart';
import 'package:login_example/page/LoginPage.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class DataScreenPage extends StatefulWidget {
  @override
  _DataScreenPageState createState() => new _DataScreenPageState();
}

class _DataScreenPageState extends State<DataScreenPage> {
  final PreferencesUtil util = PreferencesUtil();
  final CrudBloc crudBloc = CrudBloc();
  final AuthBloc authBloc = AuthBloc();
  List<GetDataResponse> data = [];
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data from API"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.QUESTION,
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Logout',
                  desc: 'Are you sure want to logout?',
                  buttonsTextStyle: TextStyle(color: Colors.black),
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    authBloc.logout().then((value) {
                      if (value)
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                    });
                  },
                )..show();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddDataScreenPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<GetDataResponse>>(
        future: crudBloc.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var list = snapshot.data;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreenPage(idItem: list[index].id)),
                      );
                    },
                    child: Container(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Image.network(
                                list[index].foto_produk,
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(list[index].item_name),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditScreenPage(
                                                    id: list[index].id)),
                                      );
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.QUESTION,
                                        headerAnimationLoop: false,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: 'Delete Item',
                                        desc:
                                            'Are you sure want to delete this item?',
                                        buttonsTextStyle:
                                            TextStyle(color: Colors.black),
                                        showCloseIcon: true,
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {
                                          setState(() {
                                            crudBloc
                                                .deleteData(list[index].id)
                                                .then((value) {
                                              if (value.sukses
                                                  .contains("sukses")) {
                                                Fluttertoast.showToast(
                                                    msg: "Delete Successful",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1);
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "Delete Failed",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1);
                                              }
                                            });
                                          });
                                        },
                                      )..show();
                                      print('lontong busek');
                                    },
                                    child: Icon(Icons.delete),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Tidak ada data ditampilkan'),
              );
            }
          } else {
            return Center(
              child: Text('Terjadi kesalahan'),
            );
          }
        },
      ),
    );
  }
}
