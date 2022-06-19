

import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/cubit/cubit.dart';

AudioPlayer player = AudioPlayer();
bool isClicked = false;
int oldIndex = 0;
List iconsList =[];

void play(String audioPath)async
{
  int result = await player.play(audioPath);
  if(result==1)
  {
    print("success");
  }
}
void stopZekr() {
  player.stop();
}

  Widget buildCardItem1(String text,int repeat,String audio)
{
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width:  double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5
            ),
            child: Text(text,
              style: const TextStyle(
                fontSize: 20,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:   [
                    const Text("عدد التكرار  : "),
                    Text("$repeat",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                IconButton(
                  onPressed: ()  {
                    play(audio);
                  },
                  icon: const Icon(Icons.volume_down),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
Widget buildCardItem2(String text,String audio,BuildContext context)
{
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal:10.0,),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width:  double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                ),
                child: Text(text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              IconButton(
                onPressed: ()  {
                  QuranAppCubit.get(context).playSound? play(audio):stopZekr();
                },
                icon: QuranAppCubit.get(context).playSound? const Icon(Icons.volume_down,color: Colors.black,):
                const Icon(Icons.volume_off,color: Colors.black,),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}