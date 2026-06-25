import 'dart:developer';

import 'package:agro/constants/colors.dart';
import 'package:agro/core/services/navigate.dart';
import 'package:agro/core/services/topsnackbar.dart';
import 'package:agro/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:agro/features/auth/presentation/widgets/agroLandingContainer.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:agro/features/classify/presentation/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNameScreen extends StatelessWidget {
  AddNameScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8F9),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AgroLandingContainer(),
                CustomTextFormField(
                  validator: (val) {
                    if (val == "") {
                      return "Name is required";
                    }
                  },
                  controller: name,
                  hintText: "Ali Raslan",
                  label: "Full Name",
                  prefixIcon: "assets/icons/personIcon.svg",
                ),
                SizedBox(
                  height: 10,
                ),
                BlocConsumer<AuthCubit, AuthCubitState>(
                  listener: (context , state){
                    if(state is SuccessCreateUserState){
                      showSuccessTopSnackBar(context,
                                  "Name has been Added Successfully, Enjoy using App");
                                  log("${name.toString()}");
                                  navigateToandReplace(context, Homescreen(name: name.text,));
                    }else if (state is FailedCreateUserState){
showErrorTopSnackBar(
                                  context, "Add Name Faild!\n ${state.errorMessage}");
                    }
                  },
                  builder: (context, state) {
                    return state is LoadingCreateUserState? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightPrimaryColor,
                            ),
                          ) : CustomButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            try {
                              await context
                                  .read<AuthCubit>()
                                  .createUser(name.text);
                              

                            } catch (e) {
                              
                            }
                          }
                        },
                        text: "Add Name");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
