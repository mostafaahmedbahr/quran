
 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/components/constatnts.dart';
import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/cubit/states.dart';


import '../widgets/card_item.dart';
 
  class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>QuranAppCubit()..getDetailData(id),
      child: BlocConsumer<QuranAppCubit,QuranAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = QuranAppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.deepOrange,
           body:  ConditionalBuilder(
             condition: state is! GetaDetilDataLoadingState,
             fallback:  (context)
             {
               return const Center(
                 child:  CircularProgressIndicator(),
               );
             },
             builder: (context)
             {
               return ListView.separated(
                 shrinkWrap: true,
                 physics:const BouncingScrollPhysics(),
                 scrollDirection: Axis.vertical,
                 itemBuilder: (context,index)=>buildCardItem1(
                     cubit.dataDetailModel!.detailData![index].arabicText!,
                   cubit.dataDetailModel!.detailData![index].repeat!,
                   cubit.dataDetailModel!.detailData![index].audioUrl!,
                 ),
                 separatorBuilder:(context,index)=>const SizedBox(height: 5,),
                 itemCount: cubit.dataDetailModel!.detailData!.length,
               );
             },

           ),
          );
        },

      ),
    );
  }



}
