// ignore_for_file: must_be_immutable

import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/constants/colors.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/screens/profilesettingsscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNameScreen extends StatelessWidget {
  EditNameScreen({super.key});
  var passwordconfirm = TextEditingController();
  var firstnamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var secformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05; // 5% of screen width
    double avatarRadius = screenWidth * 0.15; // 15% of screen width
    double fontSize = screenWidth * 0.05; // 5% of screen width
    double buttonWidth = screenWidth * 0.3; // 30% of screen width

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
          S.of(context).ChangeName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..getUserData(),
        child: BlocBuilder<UserBloc, UserStates>(
          builder: ((context, state) {
            var cubit = UserBloc.get(context);

            if (state is LoadingGetUserDataState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessGetUserDataState ||
                state is ChangeEnableState ||
                state is ChangeEditButtonState ||
                state is loadingUpdateUserNameState ||
                state is SuccessUpdateUserNameState ||
                state is loadingresetPasswordState ||
                state is SuccessresetPasswordState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          showImageDialog(context , cubit.userinfo!.image);
                        },
                        child: CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: NetworkImage(cubit.userinfo!.image),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${cubit.userinfo!.f_name} ${cubit.userinfo!.l_name}",
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.userinfo!.email!,
                        style: TextStyle(
                          fontSize: fontSize * 0.8,
                          color: Colors.grey,
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: firstnamecontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "First name can't be empty";
                                }
                                return null;
                              },
                              enabled: cubit.isenabled,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                labelText: S.of(context).first_name,
                                labelStyle: TextStyle(
                                    fontSize: fontSize, color: Medium_Green),
                                hintText: cubit.userinfo!.f_name,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: lastnamecontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Last name can't be empty";
                                }
                                return null;
                              },
                              enabled: cubit.isenabled,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                labelText: S.of(context).last_name,
                                labelStyle: TextStyle(
                                    fontSize: fontSize, color: Medium_Green),
                                hintText: cubit.userinfo!.l_name,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: state is loadingUpdateUserNameState
                                  ? CircularProgressIndicator()
                                  : MaterialButton(
                                      onPressed: () {
                                        if (cubit.editorupdatetext == "Edit" ||
                                            cubit.editorupdatetext == "تغيير") {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(S
                                                      .of(context)
                                                      .password_please),
                                                  titleTextStyle: TextStyle(
                                                      fontSize: fontSize,
                                                      color: Colors.black),
                                                  content: Container(
                                                    height: 130.0,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Form(
                                                          key: secformkey,
                                                          child: TextFormField(
                                                            validator: (value) {
                                                              if (value !=
                                                                  cubit
                                                                      .userinfo!
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
                                                        SizedBox(height: 15.0),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            cubit
                                                                .resetPassword()
                                                                .then((value) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(
                                                                    S
                                                                        .of(
                                                                            context)
                                                                        .email_sent,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                                backgroundColor:
                                                                    Colors.green[
                                                                        400],
                                                              ));
                                                            }).catchError(
                                                                    (error) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    S
                                                                        .of(context)
                                                                        .resetpasswordsentemailfailed,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors.red[
                                                                          400],
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
                                                      minWidth: buttonWidth * 0.6,
                                                      color: Colors.red,
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                    MaterialButton(
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
                                                          passwordconfirm.text =
                                                              "";
                                                        }
                                                      },
                                                      child: Text(
                                                        S.of(context).submit,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      minWidth: buttonWidth * 0.6,
                                                      color: Medium_Green,
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                        } else {
                                          if (formkey.currentState!
                                              .validate()) {
                                            cubit.updateUserName(
                                              context,
                                              firstname:
                                                  firstnamecontroller.text,
                                              lastname: lastnamecontroller.text,
                                            );
                                            cubit.getUserData();
                                          }
                                        }
                                      },
                                      child: Text(
                                        cubit.editorupdatetext,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      minWidth: buttonWidth,
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
