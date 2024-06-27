import 'dart:ui';
import 'package:agro/Bloc/states.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleManagementBloc extends Cubit<LocaleStates>{
  LocaleManagementBloc() : super(InitialState());
  // {{
  //   // Load initial language from shared preferences
  //   final lang =  CashHelper.getData(key: "lang") ?? "ar";
  //   emit(UpdateLocaleState(Locale(lang)));
  // }}
  static LocaleManagementBloc get(context) => BlocProvider.of(context);
  var  initialLanguage=CashHelper.getData(key: "lang"); 
Future changeLanguage()async{
    if (initialLanguage=="ar"){
      initialLanguage="en";
      await CashHelper.setData(key: "lang" , value: initialLanguage);
      emit(UpdateLocaleState(Locale(initialLanguage)));

    }else{
      initialLanguage="ar";
      CashHelper.setData(key: "lang" , value: initialLanguage);
      emit(UpdateLocaleState(Locale(initialLanguage)));
    }
}

void changeLanguageSetting(String lang) async {
    await CashHelper.setData(key: "lang", value: lang ?? CashHelper.getData(key: "lang"));
    emit(UpdateLoacleStateTwo(Locale(lang)));
  }
}