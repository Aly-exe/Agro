// ignore_for_file: must_be_immutable


import 'dart:developer';

import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/constants/colors.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/reusablecomponent/widgets.dart';
import 'package:agro/screens/profilesettingsscreen.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPassword extends StatelessWidget {
  EditPassword({super.key});
  var passwordconfirm = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var secformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
            log(CashHelper.getData(key: "lang"));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            navigateAndClear(context, ProfileSettingScreen());
          },
        ),
        title: Text(
          S.of(context).Changepassword,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..getUserData(),
        child: BlocConsumer<UserBloc, UserStates>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            var cubit = UserBloc.get(context);

            if (state is LoadingGetUserDataState) {
              return Center(
                child: defaultCircularProgressIndicator(),
              );
            } else if (state is SuccessGetUserDataState ||
                state is ChangeEnableState ||
                state is ChangeEditButtonState ||
                state is loadingUpdatePasswordAuthDataState ||
                state is SuccessUpdateUserPasswordState||
                state is loadingresetPasswordState||
                state is SuccessresetPasswordState ) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          showImageDialog(context , cubit.userinfo!.image);
                        },
                        child: CircleAvatar(
                          radius: width * 0.15,
                          backgroundImage: NetworkImage(cubit.userinfo!.image),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${cubit.userinfo!.f_name} ${cubit.userinfo!.l_name}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${cubit.userinfo!.email}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return S.of(context).password_please;
                                }
                                return null;
                              },
                              enabled: cubit.isenabled,
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                labelText: S.of(context).password,
                                labelStyle: TextStyle(
                                    fontSize: 25.0, color: Medium_Green),
                                hintText: "." *
                                    cubit.userinfo!.password.toString().length,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        20.0), // that place * times password length
                                alignLabelWithHint: false,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: state is loadingUpdatePasswordAuthDataState
                                  ? defaultCircularProgressIndicator()
                                  : MaterialButton(
                                      onPressed: () {
                                        if (cubit.editorupdatetext == "Edit" ||
                                            cubit.editorupdatetext == "تغيير") {
                                          showDialog(
                                              context: context,
                                              builder: (contxet) {
                                                return AlertDialog(
                                                  title: Text(S
                                                      .of(context)
                                                      .password_please),
                                                  titleTextStyle: TextStyle(
                                                      fontSize: 25.0,
                                                      color: Colors.black),
                                                  content: Container(
                                                    height: 120.0,
                                                    child: Column(
                                                      children: [
                                                        Form(
                                                          key: secformkey,
                                                          child: TextFormField(
                                                            validator: (value) {
                                                              if (value !=
                                                                  cubit.userinfo!
                                                                      .password) {
                                                                return S
                                                                    .of(context)
                                                                    .passerror;
                                                              }
                                                              return null;
                                                            },
                                                            controller:
                                                                passwordconfirm,
                                                            decoration:
                                                                InputDecoration(
                                                                    labelText: S
                                                                        .of(context)
                                                                        .password),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                            cubit
                                                                .resetPassword()
                                                                .then((value) {
                                                              ScaffoldMessenger.of(context)
                                                                                          .showSnackBar(SnackBar(
                                                                                        content: Text(
                                                                                            S.of(context).email_sent,
                                                                                            style: TextStyle(color: Colors.white)),
                                                                                        backgroundColor: Colors.green[400],
                                                                                      ));
                                                            }).catchError(
                                                                    (error) {
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            S.of(context).resetpasswordsentemailfailed,
                                                                                            style: TextStyle(color: Colors.white),
                                                                                          ),
                                                                                          backgroundColor: Colors.red[400],
                                                                                        ),
                                                                                      );
                                                                    });
                                                          },
                                                          child: Text(S
                                                              .of(context)
                                                              .resetpassword),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        passwordconfirm.text =
                                                            "";
                                                      },
                                                      child: Text(
                                                        S.of(context).cancel,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      minWidth: 60.0,
                                                      color: Colors.red,
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                    state is loadingUpdateUserDataState ||
                                                            state
                                                                is loadingUpdateAuthDataState
                                                        ? defaultCircularProgressIndicator()
                                                        : MaterialButton(
                                                            onPressed: () {
                                                              if (secformkey
                                                                  .currentState!
                                                                  .validate()) {
                                                                cubit
                                                                    .changeButtonText();
                                                                cubit
                                                                    .changeEnabledValue();
                                                                Navigator.pop(
                                                                    context);
                                                                passwordconfirm
                                                                    .text = "";
                                                              }
                                                            },
                                                            child: Text(
                                                              S
                                                                  .of(context)
                                                                  .submit,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            minWidth: 60.0,
                                                            color: Medium_Green,
                                                            shape:
                                                                ContinuousRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                  ],
                                                );
                                              });
                                        } else {
                                          if (formkey.currentState!
                                              .validate()) {
                                            cubit.updateUserPasswordAuthData(
                                                context,
                                                password:
                                                    passwordcontroller.text);
                                          }
                                        }
                                      },
                                      child: Text(
                                        cubit.editorupdatetext,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      minWidth: 100.0,
                                      color: Color(0xff4CAF50),
                                      shape: ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is FailedGetUserDataState) {
              return Center(child: Text("Failed to load user data"));
            } else {
              return Center(child: Text("Unexpected state"));
            }
          }),
        ),
      ),
    );
  }
}
