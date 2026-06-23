import 'package:agro/core/services/navigate.dart';
import 'package:agro/features/auth/presentation/views/loginscreen.dart';
import 'package:agro/features/user/presentation/veiw_moedel/user_cubit/cubit/user_cubit.dart';
import 'package:agro/features/user/presentation/widgets/AccountContainer.dart';
import 'package:agro/features/user/presentation/widgets/AppSettingContainer.dart';
import 'package:agro/features/user/presentation/widgets/CustomTitle.dart';
import 'package:agro/features/user/presentation/widgets/SupportCOntainer.dart';
import 'package:agro/features/user/presentation/widgets/UserImageContainer.dart';
import 'package:agro/features/user/presentation/widgets/UserInfo.dart';
import 'package:agro/features/user/presentation/widgets/signout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: Column(
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
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return state is LoadingSignOutState
                          ? CircularProgressIndicator()
                          : SignOut(
                              onTap: () async {
                                await context
                                    .read<UserCubit>()
                                    .signOut()
                                    .then((val) {
                                  navigateToandReplace(context, Loginscreen());
                                });
                              },
                            );
                    },
                  )
                ],
              )),
        ],
      ),
    );
  }
}
