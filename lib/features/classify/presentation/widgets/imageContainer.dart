import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.color,
      required this.title,
      required this.Subtutle,
      required this.innerColor, required this.icon, this.titleColor, this.subtitleColor, this.playIconColor});
  final Color color; // Placeholder color
  final Color innerColor; // Placeholder color
  final String title; // Placeholder color
  final String icon; // Placeholder color
  final String Subtutle; // Placeholder color
  final Color? titleColor; // Placeholder color
  final Color? subtitleColor; // Placeholder color
  final Color? playIconColor; // Placeholder color
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: innerColor,
            ),
            child: SvgPicture.asset(
              icon,
              height: 60,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 10), 
          Text(title , style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color:titleColor?? Colors.white,
            fontFamily: "Manrope",
          ),) ,
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Subtutle,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color:subtitleColor?? Colors.white70,
                fontFamily: "JetBrainsMono",
              ),),
              SizedBox(width: 10,),
              SvgPicture.asset(
                "assets/icons/playIcon.svg",
                height: 12,
                color: playIconColor?? Colors.white70,
              )
            ],
          )
        ],
      ),
    );
  }
}
