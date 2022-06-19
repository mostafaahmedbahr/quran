import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran_app/screens/new_qiblah/qiblah_campass.dart';
import 'package:quran_app/screens/new_qiblah/qiblah_maps.dart';

import 'loading_indicator.dart';

class NewQiblah extends StatefulWidget {
  @override
  _NewQiblahState createState() => _NewQiblahState();
}

class _NewQiblahState extends State<NewQiblah> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        body:  FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}