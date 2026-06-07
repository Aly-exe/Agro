
import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 85,
                backgroundColor: AppColors.imageContainerBackgroundColor,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/Ali.jpeg"),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: SvgPicture.asset("assets/icons/editicon.svg"),
              )
            ],
          )
        )
      ],
    );
  }
}