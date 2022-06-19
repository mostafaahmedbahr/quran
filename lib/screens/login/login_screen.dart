import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/toast/toast.dart';
import 'package:quran_app/core/toast/toast_states.dart';
import 'package:quran_app/core/utils/navbar.dart';
import 'package:quran_app/dio/dio_helper/end_points.dart';
import 'package:quran_app/dio/sh_pre/cache_helper.dart';
import 'package:quran_app/layout/layout_screen.dart';
import 'package:quran_app/screens/register/sign_up.dart';

  import 'cubit/cubit.dart';
import 'cubit/states.dart';

class QuranLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailCon = TextEditingController();
    var passCon = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => QuranLoginCubit(),
      child: BlocConsumer<QuranLoginCubit,QuranLoginStates>(
        listener: (context, state) {
          if(state is QuranLoginSuccessState)
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
        builder: (context, state) {
          var cubit = QuranLoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("مصحفك",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.deepOrange,
                            fontFamily: 'Blaka',
                            fontWeight: FontWeight.bold,
                          ),),
                        const Text("ورتل القران ترتيلا",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Blaka',
                            color: Colors.grey,
                          ),),
                        const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: emailCon,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "الايميل المستخدم غير صيحيح";
                            }
                          },
                          decoration: const InputDecoration(
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          onFieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              cubit.userLogin(
                                  email: emailCon.text,
                                  password: passCon.text);
                            }

                          },
                          obscureText: cubit.isVisible,
                          controller: passCon,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return "الرقم الذى ادخلته غير صحيح";
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
                            hintText: "كلمة السر",
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon:const Icon(Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.black,
                              icon: cubit.isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                              onPressed: (){
                                cubit.changeSuffixIcon();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! QuranLoginLoadingState,
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
                                  cubit.userLogin(
                                      email: emailCon.text,
                                      password: passCon.text);
                                }

                              },
                              child: const Text("تسجيل الدخول",
                                style: TextStyle(
                                  fontFamily: "Blaka",
                                  fontSize: 30,
                                ),),
                            ),
                          ),
                          fallback: (context)=>const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("أليس لديك حساب ؟",
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context)=>RegisterScreen(),),);
                              },
                              child:const Text("التسجيل",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: "Blaka",
                              ),),
                            ),
                          ],
                        ),
                      ],
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