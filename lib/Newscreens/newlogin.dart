import 'package:agro/generated/l10n.dart';
import 'package:agro/homepage.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:agro/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class NewLogin extends StatelessWidget {
  NewLogin({super.key});
  var auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issecure = true;
  IconData icon = Icons.remove_red_eye_outlined;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //866
    var width = MediaQuery.of(context).size.width; //411
    return Scaffold(
      // backgroundColor: Color(0xffD4F7D7),
      backgroundColor: Color(0xffC1F2B0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: height*.1),
      height: height*.85,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          
          Positioned(
            top: 10,
            left: -25,
            child: Image.asset(
              'assets/images/image.png',
              // width: double.infinity,
              height: height * .231,
            ),
          ),
          Positioned(
            left: width*.45,
            top: height*.02,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            // top: height * .0924,
            top: height * .22,
            left: width * .049,
            child: Container(
              width: width * .9,
              child: TextFormField(
                controller: email,
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
            top: height * .32,
            left: width * .049,
            child: Container(
              width: width * .9,
              child: TextFormField(
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
                      // setState(() {
                      //   issecure = !issecure;
                      //   issecure
                      //       ? icon = Icons.remove_red_eye_outlined
                      //       : icon = Icons.visibility_off_outlined;
                      // });
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * .43,
            left: width * .049,
            child: Row(
              children: [
                Container(
                  width: width * .9,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      auth
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text)
                          .then((value) async {
                        await CashHelper.setData(key: "ID", value: "ID=1");
                        print("${S.of(context).successful_registration}");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "${S.of(context).successful_registration}",
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.green[400],
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }).catchError((error) {
                        print("Error in Login ${error.toString()}");
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
              ],
            ),
          ),
          Positioned(
            top: height * .5,
            left: width * .15,
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
    );
  }
}
