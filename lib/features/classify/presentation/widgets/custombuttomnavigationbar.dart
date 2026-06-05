import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/homeIcon.svg",
            height: 20,
            color: Color(0xff414844),
          ),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/exploreIcon.svg",
            height: 20,
            color: Color(0xff414844),
          ),
          label: "EXPLORE",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/settingIcon.svg",
            height: 20,
            color: Color(0xff414844),
          ),
          label: "SETTINGS",
        ),
      ],
    );
  }
}