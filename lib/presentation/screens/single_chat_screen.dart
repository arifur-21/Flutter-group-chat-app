
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/theme/style.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {

  TextEditingController _messageControlloer = TextEditingController();

  @override
  void initState() {
    _messageControlloer.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageControlloer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("group name"),
      ),
      body: Column(
        children: [
          Expanded(child: _listMessageWidget()),
          
          _inputMessageTextField(_messageControlloer),
        ],
      ),
    );
  }
}

_listMessageWidget(){
  return ListView.builder(itemBuilder: (context, index){
    return Text("");
  });
}

_inputMessageTextField(_messageControlloer){
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ]
            ),
            child: Row(
              children: [
                SizedBox(width: 4,),
                Icon(Icons.insert_emoticon),
                SizedBox(width: 10,),
                
                Expanded(
                  child: Scrollbar(
                    child: TextField(
                      maxLength: null,
                      controller: _messageControlloer,
                      decoration: InputDecoration(
                        hintText: "Type a messae",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4,),
                Icon(Icons.link),
                SizedBox(width: 4,),
                Icon(Icons.camera_alt_outlined),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ),
        SizedBox(width: 8,),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(_messageControlloer.text.isEmpty? Icons.mic : Icons.send, color: Colors.white,),
        )
      ],
    ),
  );
}
