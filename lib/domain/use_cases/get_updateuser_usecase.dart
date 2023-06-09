
import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class GetUpdateUserUseCase{
  final FirebaseRepository repository;
  GetUpdateUserUseCase({ required this.repository});

  Future<void> call(UserEntity userEntity){
    return repository.getUpdateUser(userEntity);
  }

}