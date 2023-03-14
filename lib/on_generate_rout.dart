import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/constants/app_constants.dart';
import 'package:flutter_group_chat_app1/presentation/screens/create_new_group_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/forgot_password.dart';
import 'package:flutter_group_chat_app1/presentation/screens/login_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/register_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/single_chat_screen.dart';

class OnGenerateRoute{

  static Route<dynamic> route(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/' :{
        return materialBuilder(widget: LoginScreen());
      }
      case PageConst.forgotPasswordPage :{
        return materialBuilder(widget: ForgotPassword());
      }
      case PageConst.loginPage :{
        return materialBuilder(widget: LoginScreen());
      }
      case PageConst.registerPage :{
        return materialBuilder(widget: RegisterPage());
      }
      case PageConst.createNewGroup :{
        return materialBuilder(widget: CreateNewGroupScreen());
      }

      case PageConst.singleChatPage :{
        return materialBuilder(widget: SingleChatScreen());
      }

      default: return materialBuilder(widget: ErrorPage());
      
    }
  }
}

class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Error Page"),
     ),
     body: Center(
       child: Text("Error Page"),
     ),
   );
  }
  
}


MaterialPageRoute materialBuilder ({required Widget widget}){
  return MaterialPageRoute(builder: (_) => widget);
}