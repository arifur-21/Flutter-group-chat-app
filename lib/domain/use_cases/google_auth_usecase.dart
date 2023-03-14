
import '../repositories/firebase_repository.dart';

class GoogleAuthUseCase{
  final FirebaseRepository repository;
  GoogleAuthUseCase({ required this.repository});

  Future<void> googleAuth(){
    return repository.googleAuth();
  }

}