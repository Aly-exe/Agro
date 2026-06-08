
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AppSettingContainer extends StatelessWidget {
  const AppSettingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/earthIcon.svg",
                  height: 16,
                ),
                SizedBox(width: 15),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 16, fontFamily: "Manrope"),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/moonIcon.svg",
                  height: 16,
                ),
                SizedBox(width: 15),
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 16, fontFamily: "Manrope"),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Light",
                      style: TextStyle(fontSize: 16, fontFamily: "Manrope"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrowIcon.svg",
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
