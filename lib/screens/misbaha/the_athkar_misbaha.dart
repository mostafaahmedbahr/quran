import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubit/cubit.dart';
import 'package:quran_app/cubit/states.dart';


   class MisbahaAldhikr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< QuranAppCubit,QuranAppStates >(
      listener: (context,state){},
      builder: (context,state){
        var cubit = QuranAppCubit.get(context);
        return SafeArea(
          child: Scaffold(
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName1();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("الله أكبر",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName2();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("ألحمد لله",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName3();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("سبحان الله",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName4();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text(" استغفر الله",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName5();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("لا اله الا الله",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName6();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("لا حول ولا قوة الا بالله",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName7();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("سبحان الله وبحمده",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName8();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("سبحان الله العظيم",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: InkWell(
                          onTap: ()
                          {
                            cubit.changeName9();
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: const Center(
                              child: Text("اللهم صلى على سيدنا محمد",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                            height: 80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(5,5),
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}