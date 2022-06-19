
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/models/fehres_model.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'detail_quran_page.dart';
  class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranAppCubit,QuranAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = QuranAppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'الفِهْرِس',
              style: TextStyle(
                fontSize: 40,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:  FutureBuilder(
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
                    shrinkWrap: true,
                    physics:const BouncingScrollPhysics(),
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()
                        {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context)=>  DetailQuranPage(
                                name: items[index].name,
                                number: items[index].number,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                        backgroundColor: Colors.black,
                                        child: Center(child: Text("${items[index].number}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),))),
                                    const SizedBox(width: 10,),
                                    Text("${items[index].name}"),
                                    const Spacer(),
                                    Text("${items[index].englishName}"),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 34,),
                                    Text("${items[index].revelationType} - "),
                                    Text("${items[index].numberOfAyahs} أيات"),



                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                // show circular progress while data is getting fetched from json file
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      },

    );
  }
}
