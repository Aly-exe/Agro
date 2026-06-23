import 'package:agro/features/user/data/repo/user_repo_implementation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final UserRepoImplementation user = UserRepoImplementation();
  Future signOut()async{
    emit(LoadingSignOutState());
    try{
      await user.signOut();
      emit(SuccessSignOutState());
    }catch (e){
      emit(FailedSignOutState(e.toString()));
    }
  }

}
