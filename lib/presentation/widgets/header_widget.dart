
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class HeaderWidget extends StatelessWidget {

  final String title;

 HeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          alignment: Alignment.topLeft,
          child: Text(title, style: TextStyle(fontSize: 35, color: greenColor,
              fontWeight: FontWeight.w700),),
        ),
        SizedBox(height: 10,),
        Divider(thickness: 1,),
        SizedBox(height: 10,),
      ],
    );
  }
}
