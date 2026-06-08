import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpertTipContainer extends StatelessWidget {
  const ExpertTipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/tipIcon.svg"),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Expert Tip",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Manrope",
                      color: Color(0xFF86AF99),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Humidity is rising. This is a critical time fo \n Septoria spread. We recommend a full\n field walk this afternoon.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Manrope",
                color: Color(0xFF86AF99),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
