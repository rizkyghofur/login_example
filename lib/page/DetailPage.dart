import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/response/GetDataResponse.dart';

class DetailScreenPage extends StatefulWidget {
  final int idItem;

  DetailScreenPage({Key key, this.idItem}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item'),
      ),
      body: FutureBuilder<GetDataResponse>(
        future: crudBloc.getDataById(widget.idItem),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var response = snapshot.data;
              return Container(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(32.0),
                      width: 450,
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nama Item'),
                              Text(response.item_name),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Kode Item'),
                              Text(response.item_code),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Stock Item'),
                              Text(response.stock),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Price Item'),
                              Text(response.price),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Foto Item'),
                              Image.network(
                                response.foto_produk,
                                width: 200,
                                height: 200,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
