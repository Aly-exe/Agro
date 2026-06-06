import 'dart:developer';
import 'package:agro/constants/colors.dart';
import 'package:agro/features/classify/presentation/views/homeview.dart';
import 'package:agro/features/classify/presentation/widgets/custtomAppBar.dart';
import 'package:agro/features/explore/presentation/views/exploreScreen.dart';
import 'package:agro/features/user/presentation/views/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
    int index = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CusttomAppBar(),
      body: index == 0 ? HomeView() : index== 1 ? Explorescreen() : SettingsScreen(), 
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      onTap: (value){
        setState(() {
          index = value;
        });
        log("index: $index");
      },
      currentIndex: index,
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
    ),
    );
  }
}
