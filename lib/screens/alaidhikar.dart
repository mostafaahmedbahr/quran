

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/cubit/states.dart';


import '../core/components/constatnts.dart';
import '../widgets/card_item.dart';
import 'details.dart';
 class Alaidhikar extends StatelessWidget {
   AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranAppCubit,QuranAppStates>(
        listener: (context,state){},
    builder: (context,state)
    {
      var list = QuranAppCubit.get(context);
       return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ms.jpg",),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics:const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
                itemBuilder: (context,index)=>InkWell(
                  onTap: ()
                  {
                    title = list.mainTitlesModel!.arabic![index].title!;
                    id = list.mainTitlesModel!.arabic![index].id!;
                    audio = list.mainTitlesModel!.arabic![index].audioUrl!;
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>DetailPage(),
                    ),
                    );
                  },
                  child: buildCardItem2(

                      list.mainTitlesModel!.arabic![index].title!,
                    list.mainTitlesModel!.arabic![index].audioUrl!,
                    context,
                  ),
                ),
                separatorBuilder:(context,index)=>const SizedBox(height: 10,),
                itemCount: list.mainTitlesModel!.arabic!.length,
            ),

          ],
        ),
      );
    }
    );
  }

}
