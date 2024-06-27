import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/homepage.dart';
import 'package:agro/reusablecomponent/widgets.dart';
import 'package:agro/screens/editlanguage.dart';
import 'package:agro/screens/profilesettingsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            navigateAndClear(context, HomePage());
          },
        ),
        title: Text(
          S.of(context).Setting,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc()..getUserData(),
        child: BlocBuilder<UserBloc, UserStates>(
          builder: (context, state) {
            var cubit = UserBloc.get(context);
            if (state is LoadingGetUserDataState) {
              return Center(
                child: defaultCircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.001),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      GestureDetector(
                        onTap: (){
                          showImageDialog(context , cubit.userinfo!.image);
                        },
                        child: CircleAvatar(
                          radius: width * 0.15,
                          backgroundImage: NetworkImage(cubit.userinfo!.image),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        '${cubit.userinfo!.f_name} ${cubit.userinfo!.l_name}',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.userinfo!.email!,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      SettingItem(
                        icon: Icons.person,
                        text: S.of(context).editprofile,
                        onTap: () {
                          navigateTo(context, ProfileSettingScreen());
                        },
                      ),
                      SettingItem(
                        icon: Icons.language,
                        text: S.of(context).lang,
                        onTap: () {
                          navigateTo(context, EditLanguageScreen());
                        },
                      ),
                      SettingItem(
                        icon: Icons.dark_mode,
                        text: S.of(context).Mode,
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                        onTap: () {},
                      ),
                      SettingItem(
                        icon: Icons.help,
                        text: S.of(context).helpandsupport,
                        onTap: () {
                          final Uri whatsApp =
                              Uri.parse('https://wa.me/+201018961447');
                          launchUrl(whatsApp);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget trailing;
  final VoidCallback onTap;

  SettingItem({
    required this.icon,
    required this.text,
    this.trailing = const Icon(Icons.arrow_forward_ios),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
