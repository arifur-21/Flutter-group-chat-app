
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/constants/app_constants.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/header_widget.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_container.dart';

import '../widgets/container_button.dart';
import '../widgets/row_text_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController _editingController = TextEditingController();
  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            HeaderWidget(title: "Forgot Password"),
            SizedBox(height: 20,),
            Text("Forgot password"),
            SizedBox(height: 20,),
            TextFieldContainerWidget(
                controller: _editingController,
                prefixIcon: Icons.email_outlined,
                keybordType: TextInputType.emailAddress),
            SizedBox(height: 20,),
            ContainerButton(title: "Send Password Reset Email" ,
            onTap: (){

            },
            ),
            SizedBox(height: 20,),
            RowTextWidget(
              title1: "Remember the account information?",
              title2: "Login",
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, PageConst.loginPage, (route) => false);
              },
            ),
          ],
        ),
      ),

    );
  }
}
