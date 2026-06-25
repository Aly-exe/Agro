abstract class AuthRepo {
  Future<void> createProfile({
    required String name,
    required  user,
  });

  Future signUp(email, password);
  Future login(String email, String password);
}
