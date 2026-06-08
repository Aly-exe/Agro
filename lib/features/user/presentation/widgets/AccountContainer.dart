import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AccountContainer extends StatelessWidget {
  const AccountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/personIcon.svg",
              height: 16,
            ),
            SizedBox(width: 15),
            Text(
              "Profile",
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
    );
  }
}
