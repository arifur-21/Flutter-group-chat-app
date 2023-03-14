
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/constants/app_constants.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/single_item_group_widget.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (context, index){
                return SingleItemGroupWidget(
                    onTap: (){
                      Navigator.pushNamed(context, PageConst.singleChatPage);
                    });
              }),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, PageConst.createNewGroup);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
