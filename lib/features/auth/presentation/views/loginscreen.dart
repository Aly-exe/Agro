import 'package:agro/constants/colors.dart';
import 'package:agro/core/services/navigate.dart';
import 'package:agro/core/services/topsnackbar.dart';
import 'package:agro/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:agro/features/auth/presentation/views/siginupScreen.dart';
import 'package:agro/features/auth/presentation/widgets/agroLandingContainer.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:agro/features/auth/presentation/widgets/redirectionLine.dart';
import 'package:agro/features/classify/presentation/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
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
                BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    final cubit = context.read<AuthCubit>();
                    return CustomTextFormField(
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
                      obscureText: cubit.isSecure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            cubit.toggleEyePasswordIcon();
                          },
                          icon: Icon(
                            cubit.isSecure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.LightGreyTextColor,
                          )),
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocConsumer<AuthCubit, AuthCubitState>(
                    listener: (context, state) {
                  if (state is SuccessLoginState) {
                    showSuccessTopSnackBar(context, "Login Done Successfully");
                    // navigateToandReplace(context, Homescreen());
                  } else if (state is FailedLoginState) {
                    showErrorTopSnackBar(context,
                        "Login Faild!\nEmail or Password incorrect please try Again!");
                  }
                }, builder: (context, state) {
                  return state is LoadingLoginState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightPrimaryColor,
                          ),
                        )
                      : CustomButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await context
                                  .read<AuthCubit>()
                                  .login(email.text, password.text);
                            }
                          },
                          text: "Login");
                }),
                SizedBox(
                  height: 30,
                ),
                RedirectionLine(
                    lineText: "Don't have an Account? ",
                    redirectWidget: SignUpScreen(),
                    redirectText: "Sign Up")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
