import 'package:agro/homepage.dart';
import 'package:agro/login.dart';
import 'package:agro/onboarding.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/animation/Animation - 1711419248425.json'),
      splashIconSize: 240.0,
      duration: 6000,
      nextScreen: CashHelper.getData(key: "onboarding") == "false"
          ? CashHelper.getData(key: "UID") == null
              ? loginScreen()
              : HomePage()
          : OnboardingScreen(), // CashHelper.getData(key: "ID") that's correct
    );
  }
}
