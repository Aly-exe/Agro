import 'package:flutter/material.dart';

Widget defaultformfield({
  var typeofKeyboard = TextInputType.name,
  bool issecure = false,
  TextEditingController? control,
  String? label,
  double labelsize = 22.0,
  Color? labelcolor,
  String? hinttxt,
  double hinttxtsize = 18.0,
  Color? hinttxtcolor,
  IconData? preicon,
  double preiconsize = 30.0,
  Color? preiconcolor,
  IconData? suficon,
  double suficonsize = 30.0,
  Color? suficoncolor,
  VoidCallback? suffixiconfunc,
  bool? isfilled,
  Color? filledcolor,
  double radiusborder = 15.0,
  double borderlabelgap = 2.0,
  Color normalbordercolor = Colors.green,
  Color focusedbordercolor = Colors.green,
  final String? Function(String?)? validate,
  bool iseditable=true,
}) =>
    TextFormField(
      readOnly: iseditable,
      keyboardType: typeofKeyboard,
      obscureText: issecure,
      controller: control,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: labelsize, color: labelcolor),
        hintText: hinttxt,
        hintStyle: TextStyle(fontSize: hinttxtsize, color: hinttxtcolor),
        prefixIcon: Icon(
          preicon,
          color: preiconcolor,
          size: preiconsize,
        ),
        suffixIcon: IconButton(
          onPressed: suffixiconfunc,
          icon: Icon(
            suficon,
            color: suficoncolor,
            size: suficonsize,
          ),
        ),
        filled: isfilled,
        fillColor: filledcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusborder),
          gapPadding: borderlabelgap,
        ),
        //set border color without any focused
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalbordercolor)),
        //set focused border color
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedbordercolor)),
      ),
      validator: validate,
    );
   



Widget defaultCircularProgressIndicator()=> CircularProgressIndicator(
                              color: Colors.green,
                            );