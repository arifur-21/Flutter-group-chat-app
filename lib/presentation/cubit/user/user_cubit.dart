import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/get_all_users_usecase.dart';
import '../../../domain/use_cases/get_updateuser_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
 final GetUpdateUserUseCase getUpdateUserUseCase;
 final GetAllUsersUseCase getAllUsersUseCase;
  UserCubit({required this.getAllUsersUseCase, required this.getUpdateUserUseCase}) : super(UserInitial());


  Future<void>  getAllUsers()async{
    try{
    getAllUsersUseCase.call().listen((listUser) {
      emit(UserSuccess(user: listUser));
    });

    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }

 Future<void>  updateUser({required UserEntity user})async{
   try{
     getUpdateUserUseCase.call(user);
     emit(UserFailure());
   }on SocketException catch(_){
   }catch(_){
     emit(UserFailure());
   }
 }

}
