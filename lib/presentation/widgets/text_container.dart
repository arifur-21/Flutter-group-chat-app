
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class TextFieldContainerWidget extends StatelessWidget {

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keybordType;
  final String? hitText;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? iconClickEvent;


   TextFieldContainerWidget({Key? key,  this.controller, this.prefixIcon,  this.keybordType, this.hitText, this.borderRadius =10, this.color, this.iconClickEvent  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color == null ? color747480.withOpacity(.2) : color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keybordType,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: InkWell(
            onTap: iconClickEvent,
              child: Icon(prefixIcon)),
          hintText: hitText,
        ),
      ),
    );
  }
}
