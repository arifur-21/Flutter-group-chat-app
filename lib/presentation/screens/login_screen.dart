
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat_app1/constants/app_constants.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/presentation/screens/forgot_password.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/container_button.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/header_widget.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_container.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_field_password.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

import '../cubit/auth/auth_cubit.dart';
import '../cubit/credential/credential_cubit.dart';
import '../widgets/row_text_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {

        if(credentialState is CredentialSuccess){
          BlocProvider.of<AuthCubit>(context).loggedIn();
        }
        if(credentialState is CredentialFailure){
          ///
          print("Invalid email password login ");
        }
      },
      builder: (context, credentialStaate) {

        if(credentialStaate is CredentialLoading){
          return CircularProgressIndicator();
        }
        if(credentialStaate is CredentialSuccess){
          return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState){
            if(authState is AuthenticationState){
              return HomeScreen(uid: authState.uid,);
            }else{
              return _bodyWidget();
            }
          });
        }

        return _bodyWidget();
      },
    ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "Login"),

            TextFieldContainerWidget(controller: _emailController, prefixIcon: Icons.email, keybordType: TextInputType.emailAddress),
            SizedBox(height: 15,),
            TextFieldPasswordWidget(
              controller: _passwordController,
              hintText: "password",
              prefixIcon: Icons.lock,
              keybordType: TextInputType.text, ),
            SizedBox(height: 15,),
            _forgetPasswordWidget(context),
            SizedBox(height: 20,),
            ContainerButton(title: "Login",
                onTap: (){
              _submitSignIn();
              print("Login Success");
            }),

            SizedBox(height: 20,),
            RowTextWidget(
              title1: "Don't have an account?",
              title2: "Register",
              onTap: (){
                Navigator.pushNamed(context, PageConst.registerPage);
              },
            ),
            SizedBox(height: 20,),
            _rowGoogleWidget()
          ],
        ),
      ),
    );
  }
  
  void _submitSignIn(){

    if(_emailController.text.isEmpty){
      return;
    }
    if(_passwordController.text.isEmpty){
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(user: UserEntity(
      email: _emailController.text,
      password: _passwordController.text
    ));
  }
}

Widget _forgetPasswordWidget(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(''),
    InkWell(
      onTap: (){
        Navigator.pushNamed(context, PageConst.forgotPasswordPage);
      },
      child: Text("Forgot Password?", style: TextStyle(
        color: greenColor, fontSize: 16, fontWeight: FontWeight.w500
      )),
    )
    ],
  );
}


Widget _rowGoogleWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: (){

        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Icon(Icons.g_mobiledata),
        ),
      )
    ],
  );
}
