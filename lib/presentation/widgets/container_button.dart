
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class ContainerButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

   ContainerButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),),
      ),
    );
  }
}
