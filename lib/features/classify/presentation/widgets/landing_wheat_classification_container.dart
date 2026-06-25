import 'dart:io';
import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';

class LandingWhaetClassificationContainer extends StatelessWidget {
  const LandingWhaetClassificationContainer({
    super.key,
    required this.image,
    required this.wheatClassification,
  });

  final String image;
  final String wheatClassification;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: FileImage(File(image)),
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          wheatClassification,
          style: TextStyle(
              fontSize: 24,
              fontFamily: "Manrope",
              fontWeight: FontWeight.bold,
              color: AppColors.lightPrimaryColor),
        )
      ],
    );
  }
}
