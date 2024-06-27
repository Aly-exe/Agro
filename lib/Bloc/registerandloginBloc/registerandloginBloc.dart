import 'package:agro/Bloc/registerandloginBloc/registerandloginstates.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/homepage.dart';
import 'package:agro/models/userModel.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAndLoginBloc extends Cubit<RegisterAndLoginStates> {
  RegisterAndLoginBloc() : super(InitialRegisterAndLoginState());
  static RegisterAndLoginBloc get(context) => BlocProvider.of(context);
  var uid;
  UserModel? userinfo;
  Future createUser(
      {required String firstname,
      required String lastname,
      required String email,
      required dynamic password}) async {
    emit(LoadingRegisterState());
    // UserModel user = UserModel(
    //     f_name: firstname, l_name: lastname, email: email, password: password);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.toString(), password: password.toString())
        .then((value) {
      uid = value.user!.uid;
    });
    await FirebaseFirestore.instance
      ..collection('users').doc(uid).set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        'image':
            'https://firebasestorage.googleapis.com/v0/b/kamha-15aea.appspot.com/o/users%2Ffarmer.jpg?alt=media&token=3ad16183-712c-4cf1-8173-c6c50ce156be',
      }).then((value) {
        
        emit(SuccessRegisterState());
      }).catchError((error) {
        print(error.toString());
        emit(FailedRegisterState());
      });
  }
  
  Future userLogin(BuildContext context,
      {required String email, required dynamic password}) async {
    emit(LoadingLoginState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)async {
          uid = value.user!.uid;
          await FirebaseFirestore.instance.collection('users').doc(uid).update({
            'password':password
          });
      emit(SuccessLoginState());
      CashHelper.setData(key: "UID" , value:value.user!.uid );
      navigateAndClear(context, HomePage());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${S.of(context).successful_registration}",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[400],
      ));
      CashHelper.setData(key: "Uid", value: value.user!.uid);
    }).catchError((onError) {
      emit(FailedLoginState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${S.of(context).failed_registration}",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red[400],
        ),
      );
    });
  }
  Future<void> resetPassword(String email)async{
    emit(loadingresetPasswordState());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
      emit(SuccessresetPasswordState());
    }).catchError((error){
      emit(FailedresetPasswordState());
    });
  }
}
