import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/signoutIcon.svg"),
          SizedBox(
            width: 10,
          ),
          Text(
            "Sign Out",
            style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xffC13334)),
          )
        ],
      ),
    );
  }
}
