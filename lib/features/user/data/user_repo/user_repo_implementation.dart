import 'dart:io';

import 'package:agro/features/auth/data/models/userModel.dart';
import 'package:agro/features/user/data/user_repo/user_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepoImplementation implements UserRepo {
  final supabase = Supabase.instance.client;
  
  @override
  Future<UserModel> getProfile() async {
    final user = supabase.auth.currentUser!;

    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(response);
  }

  @override
  Future<void> updateName(String name) async {
    final user = supabase.auth.currentUser!;

    await supabase
        .from('profiles')
        .update({'full_name': name})
        .eq('id', user.id);
  }

  @override
  Future<void> updateImage(String imagePath) async {
    final user = supabase.auth.currentUser!;

    final file = File(imagePath);

    final fileName = '${user.id}.jpg';

    await supabase.storage
        .from('avatars')
        .upload(
          fileName,
          file,
          fileOptions:
              const FileOptions(upsert: true),
        );

    final imageUrl = supabase.storage
        .from('avatars')
        .getPublicUrl(fileName);

    await supabase
        .from('profiles')
        .update({
          'avatar_url': imageUrl,
        })
        .eq('id', user.id);
  }

  @override
  Future<void> deleteAccount() async {
    await supabase.auth.signOut();
  }
  @override
  Future signOut() async{
    await supabase.auth.signOut();
  }
}