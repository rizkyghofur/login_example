import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/response/GetDataResponse.dart';
import 'package:login_example/utils/SharedPrefs.dart';

class DataScreenPage extends StatefulWidget {
  @override
  _DataScreenPageState createState() => new _DataScreenPageState();
}

class _DataScreenPageState extends State<DataScreenPage> {
  final PreferencesUtil util = PreferencesUtil();
  final CrudBloc crudBloc = CrudBloc();
  List<GetDataResponse> data = [];
  bool isLoaded = false;
  bool isHavedata;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data from API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: !isLoaded
          ? Center(child: CircularProgressIndicator())
          : isHavedata
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 210,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Image.network(
                                "https://testing.rizkyghofur.xyz/public/image/admin/menu/normal/" +
                                    data[index].foto_menu,
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              Text(data[index].nama_menu),
                            ],
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
