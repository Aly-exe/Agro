import 'package:agro/features/user/presentation/widgets/AccountContainer.dart';
import 'package:agro/features/user/presentation/widgets/AppSettingContainer.dart';
import 'package:agro/features/user/presentation/widgets/CustomTitle.dart';
import 'package:agro/features/user/presentation/widgets/SupportCOntainer.dart';
import 'package:agro/features/user/presentation/widgets/UserImageContainer.dart';
import 'package:agro/features/user/presentation/widgets/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserImageContainer(),
        SizedBox(
          height: 10,
        ),
        UserInfoContainer(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                CustomTitle(
                  title: "ACCOUNT",
                ),
                SizedBox(
                  height: 10,
                ),
                AccountContainer(),
                SizedBox(
                  height: 10,
                ),
                CustomTitle(
                  title: "APP SETTINGS",
                ),
                SizedBox(
                  height: 10,
                ),
                AppSettingContainer(),
                SizedBox(
                  height: 10,
                ),
                CustomTitle(title: "SUPPORT"),
                SizedBox(
                  height: 10,
                ),
                SupportContainer(),
                SizedBox(
                  height: 20,
                ),
                Row(
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
                )
              ],
            )),
      ],
    );
  }
}
