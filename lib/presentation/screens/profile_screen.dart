
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/container_button.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_container.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class ProfileScreen extends StatefulWidget {

 //final UserEntity  currentuser;
  final String uid;


  ProfileScreen({ required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
   /* _nameController.value = TextEditingValue(text:  widget.currentuser.name!);
    _statusController.value = TextEditingValue(text:  widget.currentuser.status!);*/
    super.initState();
  }

  @override
  void dispose() {
   _nameController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
      child: Column(
        children: [
          SizedBox(height: 16,),
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(''),
          ),
          SizedBox(height: 16,),
          Text("Remove profile image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greenColor),),
          SizedBox(height: 16,),
          TextFieldContainerWidget(
              controller: _nameController,
              prefixIcon: Icons.person,
              hitText: 'username',
              keybordType: TextInputType.text),
          SizedBox(height: 16,),
          TextFieldContainerWidget(
              hitText: 'email',
              prefixIcon: Icons.email,

          ),
          SizedBox(height: 16,),
          TextFieldContainerWidget(
              controller: _statusController,
              hitText: 'status',
              prefixIcon: Icons.favorite,
          ),
          SizedBox(height: 10,),
          Divider(thickness: 1.50,),
          SizedBox(height: 20,),
          ContainerButton(title: "Update Profile", onTap: (){
            _updateUserProfile();
          }),
        ],
      ),
    );
  }
  
  
  void _updateUserProfile(){
    BlocProvider.of<UserCubit>(context).updateUser(user: UserEntity(
      uid:  widget.uid,
      name: _nameController.text,
      status: _statusController.text,
    ));
  }
  
}
