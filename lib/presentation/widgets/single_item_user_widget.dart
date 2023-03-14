
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';

class SingleItemUserWidget extends StatelessWidget {

  final VoidCallback onTap;


  const SingleItemUserWidget({Key? key,required this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(""),
                ),
                SizedBox(width: 10,),

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text("name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 4,),
                        Text("status", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        SizedBox(height: 8,),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Divider(
                            thickness: 1.50,
                          color: Colors.black.withOpacity(.3),),
                        ),
                      ],
                    ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
