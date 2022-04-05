import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test pertama ges',
      home: Scaffold(
          appBar: AppBar(
            title: Text('test widget kuy'),
            backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            children: <Widget>[
              Text(
                'Judul',
                style:
                    TextStyle(fontSize: 24, fontFamily: "Serif", height: 2.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(
                      'https://www.petanikode.com/img/flutter/flutter-sqr.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'bagian siji sijine',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 2.0),
                        ),
                        Text(
                          'bagian loro loronee',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 2.0),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 110),
                        Image.network(
                          'https://www.petanikode.com/img/flutter/flutter-sqr.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 2.0),
                        ),
                      ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          'https://www.petanikode.com/img/flutter/flutter-sqr.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 1.0),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          'https://www.petanikode.com/img/flutter/flutter-sqr.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 1.0),
                        ),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          'https://www.petanikode.com/img/flutter/flutter-sqr.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Serif", height: 1.0),
                        ),
                      ]),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Poliwangi memegang teguh keyakinan bahwa kolaborasi penting dalam proses pembelajaran saat ini, tidak hanya dari segi pengetahuan dan kemampuan teoritis tetapi juga untuk penerapan kesatuan ilmu dalam dunia bisnis dan dunia kerja.Dengan arsitektur pembelajaran giat Poliwangi dan institusi yang dimilikinya, Poliwangi telah bekerja sangat keras dalam dua tahun terakhir ini untuk membangun dan membina sebuah bangunan pembelajaran universitas yang kedepannya diharapkan dapat membantu memperkuat berbasis ilmu pengetahuan bisnis di Indonesia.',
                    style: TextStyle(
                        fontSize: 12, fontFamily: "Serif", height: 2.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
