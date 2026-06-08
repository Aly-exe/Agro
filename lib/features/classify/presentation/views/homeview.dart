import 'package:agro/features/classify/presentation/widgets/landingTextContainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadandtakeimagecontainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadedImageview.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
   final bool isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: isImageLoaded? 0 : 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: isImageLoaded? const SizedBox.shrink() : const LandingTextContainer(name: "Ali"),
        ),
        SizedBox(
          height: 30,
        ),
         isImageLoaded ? const UploadedImageView() : const UploadAndTakeImageContainer(),
      ],
    );
  }
}