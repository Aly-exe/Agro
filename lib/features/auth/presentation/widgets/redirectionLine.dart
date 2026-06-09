import 'package:flutter/material.dart';

class RedirectionLine extends StatelessWidget {
  final String lineText;
  final String redirectText;
  final Widget redirectWidget;
  

  const RedirectionLine({
    super.key, required this.lineText, required this.redirectWidget, required this.redirectText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(lineText , style: TextStyle(
          color: Color(0xff414844),
            fontSize: 16, 
            fontFamily: "Manrope"
        ),),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>redirectWidget));
          },
          child: Text(redirectText ,style: TextStyle(
            color: Color(0xff1F6D1A),
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            fontFamily: "Manrope"
          ),),
        )
      ],
    );
  }
}
