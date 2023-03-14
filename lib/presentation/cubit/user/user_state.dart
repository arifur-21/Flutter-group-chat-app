part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  final List<UserEntity> user;

  UserSuccess({ required this.user});

  @override
  List<Object> get props => [];
}

class UserFailure extends UserState {
  @override
  List<Object> get props => [];
}



