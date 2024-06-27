import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/reusablecomponent/widgets.dart';
import 'package:agro/screens/editnamescreen.dart';
import 'package:agro/screens/editpasswordscreen.dart';
import 'package:agro/screens/editprofileimage.dart';
import 'package:agro/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingScreen extends StatelessWidget {
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
            navigateAndClear(context, SettingScreen());
          },
        ),
        title: Text(
          S.of(context).editprofile,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc()..getUserData(),
        child: BlocConsumer<UserBloc, UserStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = UserBloc.get(context);
            if (state is LoadingGetUserDataState) {
              return Center(child: defaultCircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(width * 0.001),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.03),
                      GestureDetector(
                        onTap: (){
                          showImageDialog(context , cubit.userinfo!.image);
                        },
                        child: CircleAvatar(
                          radius: width * 0.15,
                          backgroundImage: NetworkImage(cubit.userinfo!.image),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "${cubit.userinfo!.f_name} ${cubit.userinfo!.l_name}",
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
                      SizedBox(height: height * 0.04),
                      SettingItem(
                        icon: Icons.person,
                        text: S.of(context).ChangeProfileImage,
                        onTap: () {
                          // navigateTo(context, EditProfileImageScreen());
                          navigateAndClear(context, EditProfileImageScreen());
                        },
                      ),
                      SettingItem(
                        icon: Icons.person,
                        text: S.of(context).ChangeName,
                        onTap: () {
                          navigateTo(context, EditNameScreen());
                        },
                      ),
                      SettingItem(
                        icon: Icons.lock,
                        text: S.of(context).Changepassword,
                        onTap: () {
                          navigateTo(context, EditPassword());
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
