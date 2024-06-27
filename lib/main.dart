import 'package:agro/Bloc/bloc.dart';
import 'package:agro/Bloc/registerandloginBloc/registerandloginBloc.dart';
import 'package:agro/Bloc/states.dart';
import 'package:agro/firebase_options.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:agro/splachscreen.dart';
import 'package:agro/widgets/restartwidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure all lines before runAPP() executed to run App
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CashHelper.init();
  CashHelper.getData(key: "lang") == null
      ? CashHelper.setData(key: "lang", value: "ar")
      : CashHelper.getData(key: "lang");
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LocaleManagementBloc>(
            create: (context) => LocaleManagementBloc(),
          ),
          BlocProvider<RegisterAndLoginBloc>(
            create: (context) => RegisterAndLoginBloc(),
          ),
        ],
        child: BlocBuilder<LocaleManagementBloc, LocaleStates>(
          builder: (context, state) {
            // Locale? locale;
            // if (state is UpdateLocaleState) {
            //   locale = state.locale;
            // }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(
                CashHelper.getData(key: "lang") ?? "ar",
              ),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: "Wheat Classification",
              home: SplachScreen(),
            );
          },
        ));
  }
}
