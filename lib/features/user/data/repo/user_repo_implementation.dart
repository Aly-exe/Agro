import 'package:agro/features/user/data/repo/user_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepoImplementation implements UserRepo {
  final supabase = Supabase.instance.client;
  @override
  Future signOut() async{
    await supabase.auth.signOut();
  }
}