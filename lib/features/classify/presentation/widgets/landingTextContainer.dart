import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';

class LandingTextContainer extends StatelessWidget {
  const LandingTextContainer({super.key, required this.name});
  final String name; 
  @override
  Widget build(BuildContext context) {
    return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning, Ali",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Manrope",
                          color: AppColors.GreyTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Your wheat fields are looking healthy today.\nReady for a new diagnostic?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Manrope",
                          color: AppColors.LightGreyTextColor,
                        ),
                      ),
                    ],
                  );
  }
}