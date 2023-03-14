
import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase{
  final FirebaseRepository repository;
  GetCreateCurrentUserUseCase({ required this.repository});

  Future<void> createCurrentUser(UserEntity userEntity){
    return repository.getCreateCurrentuser(userEntity);
  }

}