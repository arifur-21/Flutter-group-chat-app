part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticationState extends AuthState {
  final String uid;

  AuthenticationState({required this.uid});
  @override
  List<Object> get props => [uid];
}

class UnAuthenticationState extends AuthState {
  @override
  List<Object> get props => [];
}

