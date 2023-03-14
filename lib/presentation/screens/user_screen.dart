import 'package:flutter/cupertino.dart';
import '../../domain/entities/user_entity.dart';

import '../widgets/single_item_user_widget.dart';

class UserScreen extends StatelessWidget {
 // final List<UserEntity> users;
  //const UserScreen({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                  return SingleItemUserWidget(

                      onTap: (){

                      });
                }),
          )
        ],
      ),
    );
  }
}
