import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgroLandingContainer extends StatelessWidget {
  const AgroLandingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
        const SizedBox(
          height: 10,
        ),
       const Text(
          "Agro",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lightPrimaryColor,
              fontFamily: "Manrope"),
        ),
       const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
