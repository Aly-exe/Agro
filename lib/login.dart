import 'package:agro/Bloc/registerandloginBloc/registerandloginBloc.dart';
import 'package:agro/Bloc/registerandloginBloc/registerandloginstates.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/screens/resetpasswordscreen.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issecure = true;
  IconData icon = Icons.remove_red_eye_outlined;
  var formkey = GlobalKey<FormState>();
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return CashHelper.getData(key: "lang") == "en"
          ? 'Please enter a password'
          : "الرجاء إدخال كلمة المرور";
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //866
    var width = MediaQuery.of(context).size.width; //411
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        centerTitle: true,
        title: Text(
          S.of(context).login,
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Form(
          key: formkey,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/image.png',
                width: double.infinity,
                height: height * .231,
              ),
              Positioned(
                top: height * .0824,
                left: width * .049,
                child: Container(
                  width: width * .905,
                  child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                    controller: email,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return S.of(context).email_please;
                      } else {
                        if (!value.contains("@gmail.com")) {
                          return S.of(context).valid_email_please;
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: S.of(context).email,
                      hintStyle: TextStyle(color: Colors.grey[40]),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * .215,
                left: width * .049,
                child: Container(
                  width: width * .905,
                  child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                    validator: validatePassword,
                    obscureText: issecure,
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: S.of(context).password,
                      hintStyle: TextStyle(color: Colors.grey[40]),
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(
                        icon: Icon(icon),
                        onPressed: () {
                          setState(() {
                            issecure = !issecure;
                            issecure
                                ? icon = Icons.remove_red_eye_outlined
                                : icon = Icons.visibility_off_outlined;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: CashHelper.getData(key: "lang") == "ar"
                    ? width*.6
                    : width * .07,
                top: height * .305,
                child: GestureDetector(
                  onTap: () {
                    navigateTo(context, ResetPassword());
                  },
                  child: Text(S.of(context).resetpassword),
                ),
              ),
              BlocConsumer<RegisterAndLoginBloc, RegisterAndLoginStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Positioned(
                    top: height * .345,
                    left: width * .049,
                    child: state is LoadingLoginState
                        ? Container(
                            width: width * .905,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ),
                          )
                        : Container(
                            width: width * .905,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                var cubit = RegisterAndLoginBloc.get(context);
                                if (formkey.currentState!.validate()) {
                                  cubit.userLogin(context,
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                              child: Text(
                                S.of(context).login,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                  );
                },
              ),
              Positioned(
                top: height * .405,
                left: width * .175,
                child: Row(children: [
                  Text(
                    '${S.of(context).donot_have_account}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * .038,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "${S.of(context).create_now}",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: width * .038,
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
