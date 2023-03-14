

import '../../domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource{

  Future<void> signIn(UserEntity userEntity);
  Future<void> signUp(UserEntity userEntity);
  Future<void> forgotPassword(String email);
  Future<void> getUpdateUser(UserEntity userEntity);
  Future<void> getCreateCurrentuser(UserEntity userEntity);
  Future<bool> isSignIn();
  Future<void> singOut();
  Future<void> googleAuth();
  Future<String> getCurrentUserId();
  Stream<List<UserEntity>> getAllUsers();
}