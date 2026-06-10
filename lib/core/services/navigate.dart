import 'package:flutter/material.dart';

void navigateToandReplace( context , Widget newScreen){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>newScreen));
}