import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserImageContainer extends StatelessWidget {
  const UserImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.imageContainerBackgroundColor,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/Ali.jpeg"),
            ),
          ),
          Positioned(
            top: 70,
            left: 70,
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
