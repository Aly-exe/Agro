import 'package:agro/constants/colors.dart';
import 'package:agro/features/classify/presentation/widgets/custombuttomnavigationbar.dart';
import 'package:agro/features/classify/presentation/widgets/custtomAppBar.dart';
import 'package:agro/features/classify/presentation/widgets/imageContainer.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CusttomAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
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
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageContainer(
                        color: AppColors.primaryColor,
                        title: "Take Photo",
                        Subtutle: "FROM CAMERA",
                        innerColor: AppColors.lightPrimaryColor,
                        icon: "assets/icons/cameraIcon.svg"),
                    SizedBox(
                      width: 20,
                    ),
                    ImageContainer(
                      color: AppColors.imageContainerBackgroundColor,
                      title: "Upload Photo",
                      Subtutle: "FROM GALARY",
                      innerColor: Color(0xFFB2B4B5),
                      icon: "assets/icons/uploadfileIcon.svg",
                      titleColor: AppColors.GreyTextColor,
                      subtitleColor: AppColors.LightGreyTextColor,
                      playIconColor: AppColors.LightGreyTextColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
