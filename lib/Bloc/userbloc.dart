import 'dart:developer';
import 'dart:io';
import 'package:agro/Bloc/userStates.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/models/userModel.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserBloc extends Cubit<UserStates> {
  UserBloc() : super(InitialUserState());
  static UserBloc get(context) => BlocProvider.of(context);
  UserModel? userinfo;
  bool isenabled = false;
  String editorupdatetext =
      CashHelper.getData(key: "lang") == "ar" ? "تغيير" : "Edit";
  File? profileimage;
  var picker = ImagePicker();

  void getUserData() async {
    emit(LoadingGetUserDataState());
    var uid = FirebaseAuth.instance.currentUser!.uid ?? CashHelper.getData(key: "UID");
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      emit(SuccessGetUserDataState());
      userinfo = UserModel.fromJson(value.data()!);
    }).catchError((error) {
      emit(FailedGetUserDataState());
    });
  }

  void updateUserName(
    BuildContext context, {
    required String firstname,
    required String lastname,
  }) async {
    emit(loadingUpdateUserNameState());
    var uid = FirebaseAuth.instance.currentUser!.uid ?? CashHelper.getData(key: "UID");
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "firstname": firstname,
      "lastname": lastname,
    }).then((value) {
      emit(SuccessUpdateUserNameState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).Namesuccess,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[400],
        ),
      );
    }).catchError((error) {
      emit(FailedUpdateUserNameState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).Namefailed,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red[400],
        ),
      );
    });
  }

  // void updateUserData(
  //     {required String firstname,
  //     required String lastname,
  //     required String password}) async {
  //   emit(loadingUpdateUserDataState());
  //   var uid = FirebaseAuth.instance.currentUser!.uid;
  //   await FirebaseFirestore.instance.collection("users").doc(uid).update({
  //     "firstname": firstname,
  //     "lastname": lastname,
  //     "password": password,
  //     "image":
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn_UOLffP_F4IG7-Cwvm6ATh9tq-r1NmHdUym5R0aKnQ&s"
  //   }).then((value) {
  //     emit(SuccessUpdateUserDataState());
  //   }).catchError((error) {
  //     emit(FailedUpdateUserDataState());
  //   });
  // }

  void updateUserPasswordAuthData(BuildContext context,
      {required String password}) async {
    emit(loadingUpdatePasswordAuthDataState());
    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(EmailAuthProvider.credential(email: userinfo!.email!, password: userinfo!.password));
    await FirebaseAuth.instance.currentUser!
        .updatePassword(password)
        .then((value) async {
      var uid = FirebaseAuth.instance.currentUser!.uid  ?? CashHelper.getData(key: "UID");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .update({"password": password});
      await FirebaseAuth.instance.currentUser!.reload();
      emit(SuccessUpdateUserPasswordState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).passsuccess,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[400],
        ),
      );
    }).catchError((error) {
      emit(FailedUpdateUserPasswordState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).passfailed,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red[400],
        ),
      );
      log(error.toString());
    });
  }

  void changeEnabledValue() {
    isenabled = true;
    emit(ChangeEnableState());
  }

  void changeButtonText() {
    editorupdatetext =
        CashHelper.getData(key: "lang") == "ar" ? "تحديث" : "Update";
    emit(ChangeEditButtonState());
  }

  Future<void> uploadProfileImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileimage = File(pickedImage.path);
      emit(SuccessUploadProfileImageState());
    }
  }

  String imageurl = "";
  void UpdateProfileImage(BuildContext context) {
    emit(LoadingUpdateProfileImageState());
    log("Start Update profile Image");
    FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(profileimage!.path).pathSegments.last}")
        .putFile(profileimage!)
        .then((value) {
      log("success upload image to Firebase Storage");
      value.ref.getDownloadURL().then((value) {
        imageurl = value;
        log("Start get image link :${imageurl}");
        FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid ??  CashHelper.getData(key: "UID"))
          .update({
        "image": imageurl,
      }).then((value) {
        emit(SuccessUpdateProfileImageState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Profile Image Updated Successfully",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
      }).catchError((error) {
        log(error.toString());
        emit(FailedUpdateProfileImageState());
      });
      }).catchError((error) {
        log("AN Image url Link Error is${error.toString()}");
      });
      
    }).catchError((error) {
      log("Error when upload image to Firebase Storage ${error.toString()}");
      print(error);
    });
  }


  void UserLogin({required String email , required dynamic password}){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => null).catchError((onError){});
  }
  Future<void> resetPassword()async{
    emit(loadingresetPasswordState());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: userinfo!.email!).then((value){
      emit(SuccessresetPasswordState());
    }).catchError((error){
      emit(FailedresetPasswordState());
    });
  }
}
