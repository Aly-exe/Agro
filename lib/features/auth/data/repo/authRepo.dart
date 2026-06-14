

abstract class AuthRepo {
  Future signUp(email , password);
  Future createUser(id, name, email);
  Future login(String email , String password);
}
