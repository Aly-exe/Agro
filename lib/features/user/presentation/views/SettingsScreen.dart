import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserImageContainer(),
          SizedBox(
            height: 10,
          ),
          UserInfoContainer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  CustomTitle(
                    title: "ACCOUNT",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/personIcon.svg",
                            height: 18,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Profile",
                            style:
                                TextStyle(fontSize: 18, fontFamily: "Manrope"),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/icons/arrowIcon.svg",
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTitle(
                    title: "APP SETTINGS",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppSettingContainer(),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTitle(title: "SUPPORT"),
                  SizedBox(
                    height: 10,
                  ),
                  SupportContainer(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/signoutIcon.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontFamily: "Manrope",
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xffC13334)),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class AppSettingContainer extends StatelessWidget {
  const AppSettingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/earthIcon.svg",
                  height: 18,
                ),
                SizedBox(width: 15),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 18, fontFamily: "Manrope"),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/moonIcon.svg",
                  height: 18,
                ),
                SizedBox(width: 15),
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 18, fontFamily: "Manrope"),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Light",
                      style: TextStyle(fontSize: 18, fontFamily: "Manrope"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrowIcon.svg",
                      height: 18,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SupportContainer extends StatelessWidget {
  const SupportContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/helpIcon.svg",
                  height: 18,
                ),
                SizedBox(width: 15),
                Text(
                  "Help Center",
                  style: TextStyle(fontSize: 18, fontFamily: "Manrope"),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrowIcon.svg",
                  height: 18,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/privacyPolicyIcon.svg",
                  height: 18,
                ),
                SizedBox(width: 15),
                Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 18, fontFamily: "Manrope"),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrowIcon.svg",
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "Manrope",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.lightPrimaryColor),
      ),
    );
  }
}

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ALi Sayed",
          style: TextStyle(
              fontFamily: "manrope",
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontSize: 20),
        ),
        Text("alibnraslan@gmail.com",
            style: TextStyle(
                fontFamily: "manrope", color: Color(0xff717973), fontSize: 14)),
      ],
    );
  }
}

class UserImageContainer extends StatelessWidget {
  const UserImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: AppColors.imageContainerBackgroundColor,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/Ali.jpeg"),
            ),
          ),
          Positioned(
            top: 118,
            left: 120,
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: SvgPicture.asset(
                "assets/icons/editicon.svg",
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
