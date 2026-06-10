import 'dart:developer';

import 'package:agro/features/auth/data/repo/authRepoImplementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  // initial function to easy get instance when use Auth_Cubit
  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepoImplementation authRepoImplementation =AuthRepoImplementation();
  Future signUp(email , password) async{
    
      emit(LoadingSignUpState());
    try{
      final response = await authRepoImplementation.signUp(email , password );
      log("email : ${email}\n password : ${password} \n${response}");
      emit(SuccessSignUpState());
    }catch(e){
      log("email : ${email}\n password : ${password} \n${e.toString()}");
      emit(FailedSignUpState());

    }
  } 
  Future createUser(id , name , email) async{
    
      emit(LoadingCreateUserState());
    try{
      await authRepoImplementation.createUser(id , name ,email);
      emit(SuccessCreateUserState());
    }catch(e){
      emit(FailedCreateUserState());

    }
  } 
  Future login(email , password) async{
    
      emit(LoadingLoginState());
    try{
      await authRepoImplementation.login(email , password );
      emit(SuccessLoginState());
    }catch(e){
      emit(FailedLoginState());

    }
  } 
}
