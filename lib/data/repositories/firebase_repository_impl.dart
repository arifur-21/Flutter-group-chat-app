
import 'package:flutter_group_chat_app1/data/remote/firebase_remote_data_source.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{

  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> forgotPassword(String email) async =>
      remoteDataSource.forgotPassword(email);

  @override
  Future<void> getCreateCurrentuser(UserEntity userEntity) async =>
     await remoteDataSource.getCreateCurrentuser(userEntity);

  @override
  Future<String> getCurrentUserId() async =>
      remoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity userEntity) async =>
      remoteDataSource.getUpdateUser(userEntity);

  @override
  Future<void> googleAuth() => remoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity userEntity) async => await remoteDataSource.signIn(userEntity);

  @override
  Future<void> signUp(UserEntity userEntity) async => remoteDataSource.signUp(userEntity);

  @override
  Future<void> singOut() async => remoteDataSource.singOut();

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

}