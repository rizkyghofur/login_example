import 'package:flutter/material.dart';
import 'package:login_example/bloc/CRUDBloc.dart';
import 'package:login_example/model/response/GetBiodataResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage>
    with AutomaticKeepAliveClientMixin {
  final CrudBloc crudBloc = CrudBloc();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator(
            onRefresh: crudBloc.getBioData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  child: FutureBuilder<GetBiodataResponse>(
                    future: crudBloc.getBioData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasData) {
                          var response = snapshot.data;
                          return Container(
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(response.foto_profil),
                                  radius: 100,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(response.pekerjaan),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(response.alamat)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/flutter.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                        Text(response.total_projek)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: Image.asset(
                                        'assets/images/instagram.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      onTap: () =>
                                          launch(response.link_sosmed1),
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        'assets/images/linkedin.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      onTap: () =>
                                          launch(response.link_sosmed2),
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        'assets/images/github.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      onTap: () =>
                                          launch(response.link_sosmed3),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  response.deskripsi_profil,
                                  textAlign: TextAlign.center,
                                )
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
                          child: Text('Tidak ada data ditampilkan'),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
