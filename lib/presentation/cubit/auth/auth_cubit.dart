import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../domain/use_cases/get_current_user_id.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/is_sign_in_usecase.dart';
import '../../../domain/use_cases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.signOutUseCase,
      required this.getCurrentUserIdUseCase,
      required this.isSignInUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUserIdUseCase.call();
        emit(AuthenticationState(uid: uid));
      } else {
        emit(UnAuthenticationState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticationState());
    }
  }

  Future<void> loggedOut() async {
    try {
      signOutUseCase.signOut();
      emit(UnAuthenticationState());
    } catch (_) {
      emit(UnAuthenticationState());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUserIdUseCase.call();
      emit(AuthenticationState(uid: uid));
      print("auth cubit success");

    } catch (_) {
      print("auth cubit fail");
      emit(UnAuthenticationState());
    }
  }
}
