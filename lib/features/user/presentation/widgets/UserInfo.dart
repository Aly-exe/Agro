import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
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
