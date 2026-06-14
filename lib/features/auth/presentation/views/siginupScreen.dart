import 'package:agro/constants/colors.dart';
import 'package:agro/core/services/navigate.dart';
import 'package:agro/core/services/topsnackbar.dart';
import 'package:agro/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:agro/features/auth/presentation/views/loginscreen.dart';
import 'package:agro/features/auth/presentation/widgets/agroLandingContainer.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:agro/features/auth/presentation/widgets/redirectionLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AgroLandingContainer(),
                CustomTextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "email reqiured";
                    } else if (!value!.contains("@gmail.com")) {
                      return "not valid email";
                    }
                  },
                  controller: email,
                  hintText: "alibnraslan@gmail.com",
                  label: "Email Adress",
                  prefixIcon: "assets/icons/mailIocn.svg",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == "") {
                      return "password required";
                    } else if (value!.length < 8) {
                      return "Password must be at least 8 character";
                    }
                  },
                  label: "Password",
                  hintText: "",
                  prefixIcon: "assets/icons/lockIcon.svg",
                  obscureText: true,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.LightGreyTextColor,
                      )),
                ),
                SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    return state is LoadingSignUpState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightPrimaryColor,
                            ),
                          )
                        : CustomButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  await AuthCubit.get(context)
                                      .signUp(email.text, password.text);
                                  showSuccessTopSnackBar(context,
                                      "Successfull SignUp , Confirm your Email And add your name now");
                                  navigateToandReplace(
                                      context, Loginscreen());
                                } catch (e) {
                                  showErrorTopSnackBar(context,
                                      "SignUp Faild!\n ${e.toString()}");
                                }
                              }
                            },
                            text: "Sign Up");
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RedirectionLine(
                    lineText: "Already have an Account? ",
                    redirectWidget: Loginscreen(),
                    redirectText: "Login")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
