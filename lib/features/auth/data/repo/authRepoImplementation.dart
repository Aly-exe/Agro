import 'package:agro/features/auth/data/repo/authRepo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImplementation implements AuthRepo {
  final supabase = Supabase.instance.client;
  @override
  Future login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw ("Failed Login , {$e}");
    }
  }

  @override
  Future signUp(email , password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
      );
    } catch (e) {
      throw ("Failed Sign Up , {$e}");
    }
  }

  @override
  Future createUser(id, name, email) async {
    // TODO: implement createUser
    try {
      await supabase.from("users").insert({
        'id': id,
        'name': name,
        'email': email,
      });
    } catch (e) {
      throw ("Failed Sign Up , {$e}");
    }
  }
}
