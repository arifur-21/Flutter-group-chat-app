
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/domain/repositories/firebase_repository.dart';

class SignInUseCase{
  final FirebaseRepository repository;
  SignInUseCase({ required this.repository});

  Future<void> signIn(UserEntity userEntity)async{
    return await repository.signIn(userEntity);
  }

}