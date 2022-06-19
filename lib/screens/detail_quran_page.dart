import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/components/photo_quran.dart';
import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/cubit/states.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/models/fehres_model.dart';

class DetailQuranPage extends StatelessWidget {
  String? name;
  int? number;
  DetailQuranPage({
    required this.number,
    required this.name,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranAppCubit, QuranAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = QuranAppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(name!),
          ),
          body: SafeArea(
            child: FutureBuilder(
              future:cubit.readJsonFehresData(),
              builder: (context, data) {
                if (data.hasError) {
                  //in case if error found
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  //once data is ready this else block will execute
                  // items will hold all the data of DataModel
                  //items[index].name can be used to fetch name of product as done below
                  var items = data.data as List<Data1>;
                  return ListView.builder(
                    itemCount: quran.getVerseCount(number!),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          quran.getVerse(number!, index + 1, verseEndSymbol: true),
                          textAlign: TextAlign.right,
                        ),
                      );
                    },
                  );
                } else {
                  // show circular progress while data is getting fetched from json file
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
