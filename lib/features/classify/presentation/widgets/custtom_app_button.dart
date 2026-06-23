import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CusttomAppButton extends StatelessWidget {
  const CusttomAppButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });
  final void Function()? onTap;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                SvgPicture.asset(icon),
                const SizedBox(
                  width: 10,
                ),
                 Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontFamily: 'Monrope'),
                )
              ],
            )),
      ),
    );
  }
}
