// ignore_for_file: must_be_immutable

import 'package:agro/Bloc/registerandloginBloc/registerandloginBloc.dart';
import 'package:agro/Bloc/registerandloginBloc/registerandloginstates.dart';
import 'package:agro/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  TextEditingController email = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RegisterAndLoginBloc(),
        child: BlocBuilder<RegisterAndLoginBloc, RegisterAndLoginStates>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: Container(
                      width: width * .905,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return S.of(context).email_please;
                          } else if (!value.contains("@gmail.com")) {
                            return S.of(context).valid_email_please;
                          }
                          return null;
                        },
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
                  SizedBox(
                    height: 30.0,
                  ),
                  state is loadingresetPasswordState
                      ? Container(
                          width: width * .4,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          ),
                        )
                      : Container(
                          width: width * .4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              var cubit = RegisterAndLoginBloc.get(context);
                              if (formkey.currentState!.validate()) {
                                cubit.resetPassword(email.text).then((value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        S.of(context).email_sent,
                                        style: TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.green[400],
                                  ));
                                }).catchError((error) {
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
                              }
                            },
                            child: Text(
                              S.of(context).sendcode,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
