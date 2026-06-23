part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoadingSignOutState extends UserState {}

final class SuccessSignOutState extends UserState {}

final class FailedSignOutState extends UserState {
  final String errorMessage;
  FailedSignOutState(this.errorMessage);
}
