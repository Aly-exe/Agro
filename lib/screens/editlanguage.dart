import 'package:agro/Bloc/bloc.dart';
import 'package:agro/Bloc/states.dart';
import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:agro/setting.dart';
import 'package:agro/widgets/restartwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => LocaleManagementBloc(),
      child: BlocConsumer<LocaleManagementBloc, LocaleStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = LocaleManagementBloc.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  navigateTo(context, SettingScreen());
                },
              ),
              title: Text(S.of(context).Cahngelanguage),
            ),
            body: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).selectlanguage,
                          style: TextStyle(
                            fontSize: width * 0.06,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: DropdownButton(
                            padding: EdgeInsets.all(width * 0.03),
                            hint: Text(
                              CashHelper.getData(key: "lang") == "ar"
                                  ? "العربيه"
                                  : "en",
                              style: TextStyle(fontSize: width * 0.04),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text(S.of(context).Arabic, style: TextStyle(fontSize: width * 0.04)),
                                value: "ar",
                              ),
                              DropdownMenuItem(
                                child: Text(S.of(context).English, style: TextStyle(fontSize: width * 0.04)),
                                value: "en",
                              ),
                            ],
                            onChanged: (value) {
                              cubit.changeLanguage();
                              RestartWidget.restartApp(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
