import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';

import '../../../domain/use_cases/forgot_password_usecase.dart';
import '../../../domain/use_cases/get_create_current_user_usecase.dart';
import '../../../domain/use_cases/google_auth_usecase.dart';
import '../../../domain/use_cases/signIn_usecase.dart';
import '../../../domain/use_cases/signup_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  CredentialCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.forgotPasswordUseCase,
      required this.getCreateCurrentUserUseCase,
      required this.googleAuthUseCase})
      : super(CredentialInitial());


  Future<void> submitSignIn({ required UserEntity user})async{
    emit(CredentialLoading());
    try{
     await signInUseCase.signIn(user);
      emit(CredentialSuccess());
    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({ required UserEntity user})async{

    emit(CredentialLoading());

    try{
      print(("cubit signup ${user.email}"));
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.createCurrentUser(user);
      emit(CredentialSuccess());
    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }


  Future<void> submitGoogleAuth({ required UserEntity user})async{
    try{
      googleAuthUseCase.googleAuth();

    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({ required UserEntity user})async{
    try{
      forgotPasswordUseCase.forgotPassword(user.email!);

    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }


}
