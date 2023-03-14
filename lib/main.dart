import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat_app1/on_generate_rout.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/screens/home_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/login_screen.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) =>
        di.sl<AuthCubit>()
          ..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()..getAllUsers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Group Chat',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),

        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {

                if(authState is AuthenticationState){
                  return HomeScreen(uid: authState.uid);
                }else{
                  return LoginScreen();
                }

              },
            );
          }
        },

      ),
    );
  }
}
