import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/core/toast/toast.dart';
import 'package:quran_app/core/toast/toast_states.dart';
import 'package:quran_app/core/utils/navbar.dart';
import 'package:quran_app/dio/dio_helper/end_points.dart';
import 'package:quran_app/dio/sh_pre/cache_helper.dart';
import 'package:quran_app/layout/layout_screen.dart';
import 'package:quran_app/screens/login/login_screen.dart';


import 'bloc/cubit.dart';
import 'bloc/states.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  var nameCon = TextEditingController();
  var phoneCon = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>QuranRegisterCubit(),
      child: BlocConsumer<QuranRegisterCubit,QuranRegisterStates>(
        listener: (context,state){
          if(state is RegisterSuccessState)
          {
            if(state.loginModel.status==true)
            {
              // مهم
              TOKEN = state.loginModel.data!.token!;
              print(state.loginModel.data?.token);
              SharedPreferencesHelper.saveData(
                key: "token",
                value: state.loginModel.data?.token,
              );
              ToastConfig.showToast(
                msg: "${state.loginModel.message}",
                toastStates: ToastStates.Success,
              );
              AppNav.customNavigator(
                context: context,
                screen: LayoutScreen(),
                finish: true,
              );
            }
            if(state.loginModel.status==false)
            {
              ToastConfig.showToast(
                msg: "${state.loginModel.message}",
                toastStates: ToastStates.Error,
              );

            }
            else
            {
              ToastConfig.showToast(
                msg: "${state.loginModel.message}",
                toastStates: ToastStates.Warning,
              );
            }
          }
        },
        builder: (context,state){
          var cubit = QuranRegisterCubit.get(context);
          return  SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.deepOrange,),
                  onPressed: (){
                    AppNav.customNavigator(
                      context: context,
                      screen: QuranLoginScreen(),
                      finish: false,
                    );
                  },
                ),
              ),
              body: Container(
                width: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("انشاء حساب",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.deepOrange,
                                fontFamily: "Blaka",
                                fontWeight: FontWeight.bold,
                              ),),
                            const Text("سجل معنا لمعرفة اكثر",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Blaka",
                                color: Colors.grey,
                              ),),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.name,
                              controller: nameCon,
                              validator: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "الرجاء ادخال الاسم";
                                }
                              },
                              decoration:const InputDecoration(
                                border:OutlineInputBorder(),
                                enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    )
                                ),
                                focusedBorder:   OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                                hintText: "الأسم",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.person,
                                  color: Colors.black,),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: emailCon,
                              validator: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "يجب ادخال الايميل المسجل به";
                                }
                              },
                              decoration:const InputDecoration(
                                border:OutlineInputBorder(),
                                enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    )
                                ),
                                focusedBorder:   OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                                hintText: "الايميل",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.email,
                                  color: Colors.black,),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              obscureText: cubit.isVisible,
                              controller: passCon,
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return "تأكد من صحة الرقم السري";
                                }
                              },
                              decoration: InputDecoration(
                                border:const OutlineInputBorder(),
                                enabledBorder:const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    )
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                                hintText: "الرقم السري",
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon:const Icon(Icons.lock,
                                  color: Colors.black,),
                                suffixIcon: IconButton(
                                  color: Colors.white,
                                  icon: cubit.isVisible ?const Icon(Icons.visibility_off):Icon(Icons.visibility),
                                  onPressed: (){
                                    cubit.changeSuffixIcon();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: phoneCon,
                              validator: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "ألرقم الذى ادخلته غير صحيح";
                                }
                              },
                              decoration:const InputDecoration(
                                border:OutlineInputBorder(),
                                enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    )
                                ),
                                focusedBorder:   OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                                hintText: "رقم التليفون",
                                hintStyle:   TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.phone,
                                  color: Colors.black,),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.deepOrange,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: const FaIcon(FontAwesomeIcons.facebookF),
                                    color: Colors.white,
                                    iconSize: 30,),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.deepOrange,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon:const FaIcon(FontAwesomeIcons.google),
                                    color: Colors.white,
                                    iconSize: 30,),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.deepOrange,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: const FaIcon(FontAwesomeIcons.twitter),
                                    color: Colors.white,
                                    iconSize: 30,),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context)=> SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepOrange,
                                  ),
                                  onPressed: (){
                                    if(formKey.currentState!.validate())
                                    {
                                      cubit.userRegister(
                                          name: nameCon.text,
                                          phone: phoneCon.text,
                                          email: emailCon.text,
                                          password: passCon.text);
                                    }
                                  },
                                  child:const Text("التسجيل",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: "Blaka"
                                    ),),
                                ),
                              ),
                              fallback: (context)=>const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            const  SizedBox(
                              height: 15.0,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}