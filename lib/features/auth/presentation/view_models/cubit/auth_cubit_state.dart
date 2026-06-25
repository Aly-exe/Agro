part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}
final class LoadingSignUpState extends AuthCubitState {}
final class SuccessSignUpState extends AuthCubitState {}
final class FailedSignUpState extends AuthCubitState {
  final String errormessage;
  FailedSignUpState(this.errormessage);
}
final class LoadingLoginState extends AuthCubitState {}
final class SuccessLoginState extends AuthCubitState {}
final class FailedLoginState extends AuthCubitState {
  final String errormessage;
  FailedLoginState(this.errormessage);
}
final class LoadingCreateUserState extends AuthCubitState {}
final class SuccessCreateUserState extends AuthCubitState {}
final class FailedCreateUserState extends AuthCubitState {
  final String errorMessage;
  FailedCreateUserState(this.errorMessage);
}
final class SuccessTooggleState extends AuthCubitState {}
