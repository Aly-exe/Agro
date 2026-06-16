import 'dart:io';
import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadedImageView extends StatelessWidget {
  const UploadedImageView({super.key ,required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image.asset("assets/images/wheat.png",),
        Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  // image: AssetImage("assets/images/wheat.png"),
                  image: FileImage(File(imagePath)),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Photo ready for analysis",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          textAlign: TextAlign.center,
          "Our AI is ready to detect potential\ninfections and assess the vital health of\nyour wheat crop.",
          style: TextStyle(fontSize: 16, color: Color(0xff414844)),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
            // Handle analyze button tap
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/classifyIcon.svg"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "CLassify Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Monrope'),
                    )
                  ],
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/reloadIcon.svg" , color: Colors.green,),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Reupload Photo",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontFamily: 'Monrope'),
            ),
          ],
        )
      ],
    );
  }
}
