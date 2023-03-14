
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

typedef ToolbarIndexController = Function(int index);

class CustomTabBar extends StatefulWidget {

  final ToolbarIndexController toolbarIndexController;
  final int? pageIndex;


   CustomTabBar({Key? key,required this.toolbarIndexController, this.pageIndex =0}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor
      ),
      child: Row(
        children: [
          Expanded(
            child: TabBarItem(
              onTap: (){

                widget.toolbarIndexController(0);
              },
              title: "Groups",
              borderColor: widget.pageIndex ==0 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 0 ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: TabBarItem(
              onTap: (){
                setState(() {

                });
                widget.toolbarIndexController(1);
              },
              title: "Users",
              borderColor: widget.pageIndex ==1 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 1 ? Colors.white : Colors.black,
            ),
          ),

          Expanded(
            child: TabBarItem(
              onTap: (){

                widget.toolbarIndexController(2);
              },
              title: "Profile",
              borderColor: widget.pageIndex ==2 ? Colors.white : Colors.transparent,
              textColor: widget.pageIndex == 2 ? Colors.white : Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}


class TabBarItem extends StatelessWidget {

  final String? title;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  const TabBarItem({Key? key, this.onTap, this.textColor, this.title, this.borderWidth=3.0, this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: borderColor!, width: borderWidth!)
          )
        ),
        child: Text(title!,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),),
      ),
    );
  }
}
