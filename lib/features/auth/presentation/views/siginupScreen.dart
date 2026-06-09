import 'package:agro/constants/colors.dart';
import 'package:agro/features/auth/presentation/views/loginscreen.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:agro/features/auth/presentation/widgets/redirectionLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(12),
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  "assets/icons/carLoaderIcon.svg",
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Agro",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightPrimaryColor,
                  fontFamily: "Manrope"),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: "Ali Raslam",
              label: "Full Name",
              prefixIcon: "assets/icons/personIcon.svg",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: "alibnraslan@gmail.com",
              label: "Email Adress",
              prefixIcon: "assets/icons/mailIocn.svg",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
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
            ) , 
            SizedBox(height:20),
            CustomButton(onPressed: (){},text: "Sign Up"),
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
    );
  }
}
