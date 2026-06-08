import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
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
