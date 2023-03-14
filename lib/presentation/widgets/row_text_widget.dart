
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class RowTextWidget extends StatelessWidget {
  final String? title1;
  final String? title2;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  const RowTextWidget({Key? key, required this.onTap, required this.title1, required this.title2, this.mainAxisAlignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _rowTextWidget();
  }

  Widget _rowTextWidget(){
    return Row(
      mainAxisAlignment: mainAxisAlignment == null ? MainAxisAlignment.start : mainAxisAlignment!,
      children: [
        Text("$title1"),
        InkWell(
            onTap: onTap,
            child: Text("$title2", style: TextStyle(color: greenColor),))
      ],
    );
  }
}
