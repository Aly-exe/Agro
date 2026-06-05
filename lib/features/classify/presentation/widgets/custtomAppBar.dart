import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class CusttomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CusttomAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/agroIcon.svg",
            height: 18,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Agro",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryColor,
              fontFamily: "Manrope",
            ),
          ),
          Spacer(),
          FlutterToggleTab(
            dataTabs: [
              DataTab(
                icon: Icons.language,
                title: "EN",
              ),
              DataTab(
                title: "عربي",
              ),
            ],
            width: 30,
            borderRadius: 20,
            selectedIndex: 0,
            selectedBackgroundColors: [Colors.white70],
            unSelectedBackgroundColors: [Colors.white54],
            selectedTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Manrope",
            ),
            unSelectedTextStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Manrope",
            ),
            selectedLabelIndex: (index) {
              // Handle language change here
            },
          ),
          SizedBox(width: 15,),
          SvgPicture.asset(
            "assets/icons/burgerIcon.svg",
            height: 16,
          ),
          
        ],
      ),
    );
  }
}
