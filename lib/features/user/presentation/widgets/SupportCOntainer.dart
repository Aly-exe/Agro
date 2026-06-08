import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SupportContainer extends StatelessWidget {
  const SupportContainer({
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
                  "assets/icons/helpIcon.svg",
                  height: 16,
                ),
                SizedBox(width: 15),
                Text(
                  "Help Center",
                  style: TextStyle(fontSize: 16, fontFamily: "Manrope"),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrowIcon.svg",
                  height: 16,
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
                  "assets/icons/privacyPolicyIcon.svg",
                  height: 16,
                ),
                SizedBox(width: 15),
                Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 16, fontFamily: "Manrope"),
                ),
                Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrowIcon.svg",
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
