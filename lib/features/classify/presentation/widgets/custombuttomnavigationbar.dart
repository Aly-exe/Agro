import 'package:agro/constants/colors.dart';
import 'package:agro/features/classify/presentation/views/homescreen.dart';
import 'package:agro/features/explore/presentation/views/exploreScreen.dart';
import 'package:agro/features/user/presentation/views/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({super.key });
  
  @override
  State<CustomButtomNavigationBar> createState() => _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int? index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      onTap: (value){
        setState(() {
          index = value;
        });
      },
      currentIndex: index??0,
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