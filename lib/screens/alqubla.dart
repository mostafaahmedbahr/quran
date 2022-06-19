// import 'package:flutter/material.dart';
// import 'package:compasstools/compasstools.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quran/cubit/cubit.dart';
// import 'package:quran/cubit/states.dart';
//
// class Alqubla extends StatefulWidget {
//
//   @override
//   State<Alqubla> createState() => _AlqublaState();
// }
//
// class _AlqublaState extends State<Alqubla> {
//
//   int _haveSensor;
//   String sensorType;
//
//   @override
//   void initState() {
//     super.initState();
//     checkDeviceSensors();
//   }
//   Future<void> checkDeviceSensors() async {
//     int haveSensor;
//     try{
//       haveSensor = await Compasstools.checkSensors;
//
//       switch(haveSensor) {
//         case 0: {
//           // statements;
//           sensorType="No sensors for Compass";
//         }
//         break;
//         case 1: {
//           //statements;
//           sensorType="Accelerometer + Magnetoneter";
//         }
//         break;
//         case 2: {
//           //statements;
//           sensorType="Gyroscope";
//         }
//         break;
//         default: {
//           //statements;
//           sensorType="Error!";
//         }
//         break;
//       }
//     } on Exception {}
//     if (!mounted) return;
//     setState(() {
//       _haveSensor = haveSensor;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<QuranAppCubit,QuranAppStates>(
//         listener: (context,state){},
//     builder: (context,state){
//           return  Scaffold(
//             appBar: AppBar(
//               title: const Text('Plugin example app'),
//             ),
//             body: Column(
//               children:<Widget>[StreamBuilder(
//                 stream: Compasstools.azimuthStream,
//                 builder: (BuildContext context, AsyncSnapshot<int> snapshot){
//                   if(snapshot.hasData) {
//                     return
//                       Padding(
//                         padding: const EdgeInsets.all(20),
//                         child:Center(
//                           child:RotationTransition(turns:   AlwaysStoppedAnimation(-snapshot.data/360),
//                             child: Image.asset("assets/images/q2.png"),
//                           ),
//                         ),
//                       );
//                   } else {
//                     return const Text("Error in stream");
//                   }
//                 },
//               ),
//                 Text("SensorType: "+sensorType),
//               ],),
//           );
//     },
//     );
//   }
//
// }
