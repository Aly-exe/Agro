
import 'package:agro/features/auth/data/models/userModel.dart';

abstract class AuthRepo {
  Future signUp(email , password);
  Future createUser(id, name, email);
  Future login(String email , String password);
}
