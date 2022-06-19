import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/cubit/states.dart';


class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranAppCubit,QuranAppStates>(
        listener: (context,state){},
      builder: (context,state){
        var cubit = QuranAppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.deepOrange,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon:Icon(Icons.home),
                  label: "القائمة",
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.cached_outlined),
                  label: "المسبحة",
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.track_changes_outlined),
                  label: "القبلة",
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.book_online_outlined),
                  label: "المصحف",
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.article),
                  label: "الادعية",
                ),
              ],
            ),
          );
      },

    );
  }
}
