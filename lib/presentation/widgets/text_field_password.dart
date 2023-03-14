
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class TextFieldPasswordWidget extends StatefulWidget {

  final TextEditingController controller;
  final IconData prefixIcon;
  final TextInputType keybordType;
  final String? hintText;


   TextFieldPasswordWidget({Key? key, required this.controller, required this.prefixIcon, required this.keybordType,required this.hintText}) : super(key: key);

  @override
  State<TextFieldPasswordWidget> createState() => _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color747480.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: isObscureText,
        keyboardType: widget.keybordType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: InkWell(
            onTap: (){
             setState(() {
               isObscureText = !isObscureText;
             });
            },
              child: Icon(isObscureText == true ? Icons.remove_red_eye : Icons.panorama_fish_eye))
          ),
        ),
      );

  }
}
