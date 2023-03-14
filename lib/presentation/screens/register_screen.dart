import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/credential/credential_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/screens/home_screen.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/container_button.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/header_widget.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/row_text_widget.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_container.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_field_password.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

import '../../constants/app_constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordAgainController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {

          if(credentialState is CredentialSuccess){
            print("valid password");
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if(credentialState is CredentialFailure){
            ///
            print("Invalid email password");
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
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
      child: Container(
        child: Column(
          children: [
            HeaderWidget(title: "Registration"),
            SizedBox(height: 16,),
            _profileWidget(),
            SizedBox(height: 16,),
            TextFieldContainerWidget(
                controller: _userNameController,
                prefixIcon: Icons.person,
                hitText: "username",
                keybordType: TextInputType.text),
            SizedBox(height: 16,),
            TextFieldContainerWidget(
                controller: _emailController,
                prefixIcon: Icons.person,
                hitText: "email",
                keybordType: TextInputType.text),
            SizedBox(height: 16,),
            Divider(indent: 120,
              endIndent: 120,
              thickness: 2,),
            SizedBox(height: 16,),
            TextFieldPasswordWidget(
                controller: _passwordController,
                hintText: "password",
                prefixIcon: Icons.lock,
                keybordType: TextInputType.text),
            SizedBox(height: 16,),
            TextFieldPasswordWidget(
                controller: _passwordAgainController,
                hintText: "Confrom Password",
                prefixIcon: Icons.lock,
                keybordType: TextInputType.text),

            SizedBox(height: 16,),

            TextFieldContainerWidget(
                controller: _dobController,
                prefixIcon: Icons.person,
                hitText: "D.O.B",
                keybordType: TextInputType.datetime),
            SizedBox(height: 16,),
            TextFieldContainerWidget(
                controller: _genderController,
                hitText: "gender",
                prefixIcon: Icons.lock,
                keybordType: TextInputType.text),
            SizedBox(height: 16,),

            ContainerButton(
                title: "Register",
                onTap: () {
                  print("register btn onTap");
                  _submitSignUp();
                }),
            SizedBox(height: 16,),
            RowTextWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.loginPage, (route) => false);
                },
                title1: "Do you have already an account?",
                title2: "Login"),

          ],
        ),
      ),
    );
  }

  void _submitSignUp() {

    if (_userNameController.text.isEmpty) {
      return;
    }

    if (_emailController.text.isEmpty) {
      return;
    }

    if (_passwordController.text == _passwordAgainController.text) {
    print("enter your password ");
    } else {
      return;
    }
    print("SignUp data");
    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
        name: _userNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        isOnline: false,
        status: "",
        profileUrl: "",
        phoneNumber: "",
        dob: _dobController.text.isEmpty ? "" : _dobController.text,
        gender: _genderController.text.isEmpty ? "" : _genderController.text

    ));

  }
}


Widget _profileWidget() {
  return Column(
    children: [
      Container(
        height: 62,
        width: 62,
        decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle
        ),
        child: Image.asset("assets/coffe.jpg", fit: BoxFit.cover),
      ),
      SizedBox(height: 16,),
      Text("add profile image", style: TextStyle(color: greenColor),),
      SizedBox(height: 16,),
    ],
  );
}