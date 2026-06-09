import 'package:agro/features/auth/presentation/views/loginScreen.dart';
import 'package:agro/features/auth/presentation/widgets/redirectionLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1B4332),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Manrope"),
            ),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset("assets/icons/rightArrowIcon.svg"),
          ],
        ),
      ),
      
    );
  }
}
