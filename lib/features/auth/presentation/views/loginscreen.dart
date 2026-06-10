import 'package:agro/constants/colors.dart';
import 'package:agro/features/auth/presentation/views/siginupScreen.dart';
import 'package:agro/features/auth/presentation/widgets/agroLandingContainer.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:agro/features/auth/presentation/widgets/redirectionLine.dart';
import 'package:agro/features/classify/presentation/views/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AgroLandingContainer(),
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
            CustomButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Homescreen()));
            },text: "Login"),
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
    );
  
  }
}