import 'package:agro/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<dynamic> AuthentecateUser(
    {required String email,
    required String password,
    required String firstname,
    required String lastname}) async {
  var auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //to Create User to can register to our App
  await auth.createUserWithEmailAndPassword(email: email, password: password);
  //Add user date to cloud Firestore
  await users.add({
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
  });
}

void navigateAndClear(BuildContext context, Widget newscreen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => newscreen), (route) => false);
}

void navigateTo(BuildContext context, Widget newscreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => newscreen));
}
void showImageDialog(BuildContext context,String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(S.of(context).close),
              ),
            ],
          ),
        );
      },
    );
  }