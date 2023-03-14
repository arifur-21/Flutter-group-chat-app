
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemGroupWidget extends StatelessWidget {

  final VoidCallback onTap;
  const SingleItemGroupWidget({Key? key,required this.onTap}) : super(key: key);

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
                        Text("Group name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 4,),
                        Text("Current message", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
