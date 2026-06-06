import 'package:agro/constants/colors.dart';
import 'package:agro/features/classify/presentation/widgets/expertTipContainer.dart';
import 'package:agro/features/classify/presentation/widgets/imageContainer.dart';
import 'package:flutter/material.dart';

class UploadAndTakeImageContainer extends StatelessWidget {
  const UploadAndTakeImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
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
        ),
        const SizedBox(
          height: 30,
        ),
        ExpertTipContainer()
      ],
    );
  }
}
