
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/container_button.dart';
import '../widgets/text_container.dart';
import '../widgets/theme/style.dart';

class CreateNewGroupScreen extends StatefulWidget {
  const CreateNewGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewGroupScreen> createState() => _CreateNewGroupScreenState();
}

class _CreateNewGroupScreenState extends State<CreateNewGroupScreen> {


  TextEditingController _groupNameController = TextEditingController();


  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New page"),
      ),
      body: Container(
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
            Text("add group image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: greenColor),),
            SizedBox(height: 16,),
            TextFieldContainerWidget(
                controller: _groupNameController,
                prefixIcon: Icons.person,
                hitText: 'username',
                keybordType: TextInputType.text),
            SizedBox(height: 20,),
            Divider(
              endIndent: 100,
              indent: 100,
              thickness: 2),
            SizedBox(height: 20,),
            ContainerButton(title: "Create New Group", onTap: (){}),
          ],
        ),
      ),
    );
  }
}
