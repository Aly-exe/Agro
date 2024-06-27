// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:agro/Bloc/registerandloginBloc/registerandloginBloc.dart';
import 'package:agro/Bloc/registerandloginBloc/registerandloginstates.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/login.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController f_name = TextEditingController();

  TextEditingController l_name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool issecure = true;
  IconData icon = Icons.remove_red_eye;
  bool hasMinLength = false;
  bool hasletter = false;
  bool hasDigit = false;
  bool hasSpecialChar = false;

  String? validatePassword(String? value) {
    // At least 8 characters
    // At least one uppercase letter
    // At least one lowercase letter
    // At least one number
    // At least one special character
    if (value == null || value.isEmpty) {
      return CashHelper.getData(key: 'lang')=="en"? 'Please enter a password':"أدخل كلمة المرور";
    }else if(value.length < 8) {
      return CashHelper.getData(key: 'lang')=="en"? "password must be at least 8 character ":"يجب أن تكون كلمة مرور كلمة مرور على الأقل 8 حرف";
    }else if(!value.contains(RegExp(r'[A-Za-z]')) && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include letter , special char":"كلمة المرور يجب أن تتضمن رقم و رمز";
    }else if(!value.contains(RegExp(r'[A-Za-z]')) && !value.contains(RegExp(r'\d'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include one letter , number":"يجب أن تتضمن كلمة المرور حرف و رقم .";
    }else if(!value.contains(RegExp(r'\d')) && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include one number , special char":"يجب أن تتضمن كلمة المرور رقم و رمز";
    }else if(value.contains(RegExp(r'[A-Za-z]')) && !value.contains(RegExp(r'\d')) && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include one number , special char":"يجب أن تتضمن كلمة المرور رقم و رمز";
    }else if(!value.contains(RegExp(r'[A-Za-z]')) && value.contains(RegExp(r'\d')) && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include one letter , special char":"يجب أن تتضمن كلمة المرور حرف  و حرف";
    }else if(!value.contains(RegExp(r'[A-Za-z]')) && !value.contains(RegExp(r'\d')) && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include one letter , number":"يجب أن تتضمن كلمة المرور حرف و رقم .";
    }else if(!value.contains(RegExp(r'[A-Za-z]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include at least one letter":"يجب أن تتضمن كلمة المرور حرف واحد علي الأقل";
    }else if(!value.contains(RegExp(r'\d'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include at least one number":"يجب أن تتضمن كلمة المرور رقم واحد علي الأقل";
    }else if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return CashHelper.getData(key: 'lang')=="en"? "password must include at least one special char":"يجب أن تتضمن كلمة المرور رمز واحد علي الأقل";
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back ,color: Colors.green,) ,onPressed: (){
          navigateAndClear(context, loginScreen());
        },) ,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          '${S.of(context).create_acc}',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .0389),
          child: Container(
            height: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/image.png',
                  width: width * .61,
                  height: height * .231,
                ),
                //first name , last name 
                Row(
                  children: [
                    Container(
                      width: width * .44,
                      child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                        controller: f_name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return S.of(context).first_name_please;
                          }else if(!value.contains(RegExp(r'[A-Za-z]'))){
                            return S.of(context).validName;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: '${S.of(context).first_name}',
                          hintStyle: TextStyle(color: Colors.grey[40]),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .0243,
                    ),
                    Container(
                      width: width * .44,
                      child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                        controller: l_name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return S.of(context).last_name_please;
                          }else if(!value.contains(RegExp(r'[A-Za-z]'))){
                            return S.of(context).validName;
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "${S.of(context).last_name}",
                          hintStyle: TextStyle(color: Colors.grey[40]),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
                //email
                Positioned(
                  top: height * .13,
                  child: Container(
                    width: width * .905,
                    child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: '${S.of(context).email}',
                        hintStyle: TextStyle(color: Colors.grey[40]),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),
                ),
                //password
                Positioned(
                  top: height * .261,
                  child: Container(
                    width: width * .905,
                    child: TextFormField(
                      textDirection: CashHelper.getData(key: "lang")=="ar" ? TextDirection.rtl :TextDirection.ltr ,
                      obscureText: issecure,
                      controller: password,
                      validator: validatePassword
                      //  (String? value) {
                      //   if (value!.isEmpty) {
                      //     return S.of(context).password_please;
                      //   }
                      //   return null;
                      // }
                      ,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: '${S.of(context).password}',
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
                // Signup button
                BlocConsumer<RegisterAndLoginBloc, RegisterAndLoginStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Positioned(
                      top: height*.39,
                      child: state is LoadingRegisterState
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
                                    var cubit =
                                        RegisterAndLoginBloc.get(context);
                                    if (formkey.currentState!.validate()) {
                                      cubit
                                          .createUser(
                                              firstname: f_name.text,
                                              lastname: l_name.text,
                                              email: email.text,
                                              password: password.text)
                                          .then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              S
                                                  .of(context)
                                                  .successful_registration,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          backgroundColor: Colors.green[400],
                                        ));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    loginScreen()));
                                      }).catchError((error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            S.of(context).failed_registration,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red[400],
                                        ));
                                      });
                                    
                                    } 
                                  },
                                  child: Text(
                                    '${S.of(context).signup}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * .065,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ))),
                    );
                  },
                ),
                Positioned(
                  top: height*.455,
                  left: width * .18,
                  child: Row(children: [
                    Text(
                      '${S.of(context).have_acc}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width * .038,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen()));
                      },
                      child: Text(
                        "${S.of(context).login}",
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
      ),
    );
  }
}
