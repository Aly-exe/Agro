import 'dart:developer';
import 'package:agro/features/auth/data/repo/authRepoImplementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  // initial function to easy get instance when use Auth_Cubit
  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepoImplementation authRepoImplementation =
      AuthRepoImplementation();
  bool isSecure = true;
  Future signUp(email, password) async {
    emit(LoadingSignUpState());
    try {
      final response = await authRepoImplementation.signUp(email, password);
      log("${response.toString()}");
      emit(SuccessSignUpState());
    } catch (e) {
      log("${e.toString()}");
      emit(FailedSignUpState(e.toString()));
    }
  }

  Future createUser(name) async {
    emit(LoadingCreateUserState());
    try {
      final user = Supabase.instance.client.auth.currentUser;
      log("user id : ${user?.id}");
      log("user email : ${user?.email}");
      await authRepoImplementation.createProfile(name: name , user: user);
      emit(SuccessCreateUserState());
    } catch (e) {
      emit(FailedCreateUserState(e.toString()));
    }
  }

  Future login(email, password) async {
    emit(LoadingLoginState());
    try {
      final response = await authRepoImplementation.login(email, password);
      log(response.toString());
      emit(SuccessLoginState());
    } catch (e) {
      log("Failed , ${e}");
      emit(FailedLoginState(e.toString()));
    }
  }

  void toggleEyePasswordIcon() {
    isSecure = !isSecure;
    log("${isSecure}");
    emit(SuccessTooggleState());
  }
}
