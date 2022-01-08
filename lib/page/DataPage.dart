import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/constants/URLConstants.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/model/sqliteModel.dart';
import 'package:login_example/page/DetailPage.dart';
import 'package:login_example/page/EditPage.dart';
import 'package:login_example/utils/Injector.dart';
import 'package:login_example/utils/MyConnection.dart';
import 'package:login_example/utils/SharedPrefs.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DataScreenPage extends StatefulWidget {
  @override
  _DataScreenPageState createState() => new _DataScreenPageState();
}

class _DataScreenPageState extends State<DataScreenPage> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;
  final PreferencesUtil util = PreferencesUtil();
  final CrudBloc crudBloc = CrudBloc();
  List<GetDataResponse> data = [];
  List<Menu> dataoffLine = [];
  bool isLoaded = false;
  bool isHavedata;
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    checkInet();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  void checkInet() async {
    await isInternetAvailable().then((value) {
      if (value)
        _getData();
      else
        _getDataOffline();
    });
  }

  void _getData() async {
    await crudBloc.getData().then((value) {
      setState(() {
        isLoaded = true;
        data = value;
        if (data.length == 0) {
          isHavedata = false;
        } else {
          isHavedata = true;
        }
      });
    });
  }

  void _getDataOffline() async {
    await Menu().select().toList().then((value) {
      isLoaded = true;
      dataoffLine = value;
      if (dataoffLine.length == 0) {
        isHavedata = false;
      } else {
        isHavedata = true;
      }
    });
  }

  Future<void> _refreshData() async {
    if (data.length != 0) {
      data.clear();
    }
    setState(() {
      isLoaded = false;
      isHavedata = false;
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    List list = isOnline ? data : dataoffLine;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        isOnline = true;
        break;
      case ConnectivityResult.wifi:
        isOnline = true;
        break;
      case ConnectivityResult.none:
      default:
        isOnline = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Data from API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: !isLoaded
          ? Center(child: CircularProgressIndicator())
          : isHavedata
              ? isOnline
                  ? RefreshIndicator(
                      onRefresh: _refreshData,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
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
                                    builder: (context) => DetailScreenPage(
                                        idMenu: list[index].id)),
                              );
                            },
                            child: Container(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        UrlConstants.getImagelink +
                                            list[index].foto_menu,
                                        width: 50,
                                        height: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text(list[index].nama_menu),
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
                                                buttonsTextStyle: TextStyle(
                                                    color: Colors.black),
                                                showCloseIcon: true,
                                                btnCancelOnPress: () {},
                                                btnOkOnPress: () {
                                                  setState(() {
                                                    crudBloc
                                                        .deleteData(
                                                            list[index].id)
                                                        .then((value) {
                                                      _refreshData();
                                                      if (value.success
                                                          .contains(
                                                              "success")) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Delete Successful",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1);
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Delete Failed",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1);
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
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreenPage()),
                            );
                          },
                          child: Container(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                      UrlConstants.getImagelink +
                                          list[index].foto_menu,
                                      width: 50,
                                      height: 50,
                                    ),
                                    SizedBox(height: 10),
                                    Text(list[index].nama_menu),
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
                                            print('lontong busek');
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.QUESTION,
                                              headerAnimationLoop: false,
                                              animType: AnimType.BOTTOMSLIDE,
                                              title: 'Delete Item',
                                              desc:
                                                  'Are you sure want to delete this item?',
                                              buttonsTextStyle: TextStyle(
                                                  color: Colors.black),
                                              showCloseIcon: true,
                                              btnCancelOnPress: () {},
                                              btnOkOnPress: () {
                                                setState(() {
                                                  crudBloc
                                                      .deleteData(
                                                          list[index].id)
                                                      .then((value) {
                                                    _refreshData();
                                                    if (value.success
                                                        .contains("success")) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Delete Successful",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb:
                                                              1);
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg: "Delete Failed",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .CENTER,
                                                          timeInSecForIosWeb:
                                                              1);
                                                    }
                                                  });
                                                });
                                              },
                                            )..show();
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
                    )
              : Center(
                  child: new Text("No data"),
                ),
    );
  }
}
