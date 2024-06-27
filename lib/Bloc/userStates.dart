abstract class UserStates {}
class InitialUserState extends UserStates{}
class LoadingGetUserDataState extends UserStates{}
class SuccessGetUserDataState extends UserStates{}
class FailedGetUserDataState extends UserStates{}
class ChangeEnableState extends UserStates{}
class ChangeEditButtonState extends UserStates{}
class loadingUpdateUserDataState extends UserStates{}
class loadingUpdateUserNameState extends UserStates{}
class SuccessUpdateUserNameState extends UserStates{}
class FailedUpdateUserNameState extends UserStates{}
class loadingUpdateAuthDataState extends UserStates{}
class loadingUpdatePasswordAuthDataState extends UserStates{}
class SuccessUpdateUserEmailState extends UserStates{}
class FailedUpdateUserEmailState extends UserStates{
  String? error;
  FailedUpdateUserEmailState( error);
}
class SuccessUpdateUserPasswordState extends UserStates{}
class FailedUpdateUserPasswordState extends UserStates{}

class SuccessUploadProfileImageState extends UserStates{}
class FailedUploadProfileImageState extends UserStates{}
class LoadingUpdateProfileImageState extends UserStates{}
class SuccessUpdateProfileImageState extends UserStates{}
class FailedUpdateProfileImageState extends UserStates{}
class loadingresetPasswordState extends UserStates{}
class SuccessresetPasswordState extends UserStates{}
class FailedresetPasswordState extends UserStates{}

