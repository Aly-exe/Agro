import 'package:agro/features/auth/data/models/userModel.dart';

abstract class UserRepo{

  Future<UserModel> getProfile();

  Future<void> updateName(String name);

  Future<void> updateImage(String imagePath);

  Future<void> deleteAccount();
  Future signOut();
}