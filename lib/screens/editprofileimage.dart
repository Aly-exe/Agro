import 'package:agro/Bloc/userStates.dart';
import 'package:agro/Bloc/userbloc.dart';
import 'package:agro/constants/colors.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/reusablecomponent/widgets.dart';
import 'package:agro/screens/profilesettingsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileImageScreen extends StatelessWidget {
  const EditProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..getUserData(),
      child: BlocBuilder<UserBloc, UserStates>(
        builder: (context, state) {
          var cubit = UserBloc.get(context);
          var profileimage = UserBloc.get(context).profileimage;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    navigateAndClear(context, ProfileSettingScreen());
                  },
                ),
                title: Text(
                  S.of(context).ChangeProfileImage,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              body: state is LoadingGetUserDataState
                  ? Center(
                      child: defaultCircularProgressIndicator(),
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                  radius: 70,
                                  backgroundImage: profileimage != null
                                      ? FileImage(profileimage) as ImageProvider
                                      : NetworkImage(cubit.userinfo!.image)),
                              IconButton(
                                iconSize: 30.0,
                                color: Colors.white,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Medium_Green),
                                ),
                                onPressed: () {
                                  cubit.uploadProfileImage();
                                },
                                icon: Icon(Icons.add_a_photo_outlined),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          state is LoadingUpdateProfileImageState
                              ? defaultCircularProgressIndicator()
                              : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Medium_Green),
                                  ),
                                  onPressed: () {
                                    if (profileimage == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            S.of(context).imageprofileerror,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      cubit.UpdateProfileImage(context);
                                    }
                                  },
                                  child: Text(
                                    S.of(context).update,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}
