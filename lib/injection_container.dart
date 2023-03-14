
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_group_chat_app1/data/remote/firebase_remote_data_source.dart';
import 'package:flutter_group_chat_app1/data/remote/firebase_remote_data_source_impl.dart';
import 'package:flutter_group_chat_app1/data/repositories/firebase_repository_impl.dart';
import 'package:flutter_group_chat_app1/domain/repositories/firebase_repository.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/forgot_password_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/get_all_users_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/get_current_user_id.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/get_updateuser_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/google_auth_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/is_sign_in_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/signIn_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/sign_out_usecase.dart';
import 'package:flutter_group_chat_app1/domain/use_cases/signup_usecase.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;


Future<void> init()async{

  //bloc
sl.registerFactory<AuthCubit>(() => AuthCubit(
    signOutUseCase: sl.call(),
    getCurrentUserIdUseCase: sl.call(),
    isSignInUseCase: sl.call()));

///user bloc
sl.registerFactory<UserCubit>(() => UserCubit(
    getAllUsersUseCase: sl.call(),
    getUpdateUserUseCase: sl.call()));

sl.registerFactory<CredentialCubit>(() => CredentialCubit(
    signInUseCase: sl.call(),
    signUpUseCase: sl.call(),
    forgotPasswordUseCase: sl.call(),
    getCreateCurrentUserUseCase: sl.call(),
    googleAuthUseCase: sl.call()));


  //Usercase
  ///authCubit usecase
  sl.registerLazySingleton<GetCurrentUserIdUseCase>(() => GetCurrentUserIdUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(() => IsSignInUseCase(repository: sl.call()));
  //CredentialCubit Usecase
  sl.registerLazySingleton<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(() => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GoogleAuthUseCase>(() => GoogleAuthUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(repository: sl.call()));

  ///user get and update data
  sl.registerLazySingleton<GetUpdateUserUseCase>(() => GetUpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllUsersUseCase>(() => GetAllUsersUseCase(repository: sl.call()));

  //Repository
sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  //remote dataSource
sl.registerLazySingleton<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImpl(
    firestore: sl.call(),
    auth: sl.call(),
    googleSignIn: sl.call()));
  // local surce

  //external

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);

}