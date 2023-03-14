
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_chat_app1/data/remote/models/user_model.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/cubit/user/user_cubit.dart';
import 'package:flutter_group_chat_app1/presentation/screens/group_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/profile_screen.dart';
import 'package:flutter_group_chat_app1/presentation/screens/user_screen.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter_group_chat_app1/presentation/widgets/text_container.dart';

import '../widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  const HomeScreen({Key? key,required this.uid}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _searchController = TextEditingController();
  PageController _pageVeiwController = PageController(initialPage: 0);
  bool _isSearch = false;
  int _toolBarPageIndex = 0;



  List<String> _popupMenuList = ['Logout'];

  List<Widget> get page => [GroupScreen(), UserScreen(), ProfileScreen(uid: widget.uid,),];

  @override
  void dispose() {
    _searchController.dispose();
    _pageVeiwController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget(){
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0,0.50),
            )
          ]
      ),

      child: TextFieldContainerWidget(
        controller: _searchController,
        prefixIcon: Icons.arrow_back,
        hitText: "Search...",
        keybordType: TextInputType.text,
        borderRadius: 0.0,
        color: Colors.white,
        iconClickEvent: (){
          setState(() {
            _isSearch = !_isSearch;
          });
        },
      ),

    );
  }

  Widget _emptyContainer(){
    return Container(height: 0, width: 0,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      backgroundColor: _isSearch == true ? Colors.transparent : primaryColor,
        elevation: 0,
        title: _isSearch == true ? _emptyContainer() : Text("Group Chat"),
        flexibleSpace: _isSearch == true ? _buildSearchWidget() : _emptyContainer(),
        actions: _isSearch == true? [] : [
          InkWell(
            onTap: (){
              setState(() {
                _isSearch = !_isSearch;
              });
            },
              child: Icon(Icons.search)),

          PopupMenuButton(
            onSelected: (value){
              if(value == "Logout"){
                BlocProvider.of<AuthCubit>(context).loggedOut();
              }
            },
              itemBuilder: (_) => _popupMenuList.map((menuItem){
            return PopupMenuItem(child: Text("$menuItem"), value: menuItem,);
          }).toList()),

        ],

      ),
      body:  BlocBuilder<UserCubit, UserState>(
  builder: (context, userState) {
    if(userState is UserSuccess){

     final currenuser = userState.user.firstWhere((element) =>
      element.uid == widget.uid, orElse: ()=> UserModel());
   final  users = userState.user.where((element) => element.uid != widget.uid).toList();

      return Column(
        children: [
          _isSearch == true? _emptyContainer() : CustomTabBar(
              pageIndex: _toolBarPageIndex,
              toolbarIndexController: (int index){

                print("current page Index ${index}");
                setState(() {
                  _toolBarPageIndex = index;
                });
                _pageVeiwController.jumpToPage(index);
              }),
          Expanded(

            child: PageView.builder(
                controller: _pageVeiwController,
                onPageChanged: (index){
                  setState(() {
                    _toolBarPageIndex = index;
                  });
                },
                itemCount: page.length,
                itemBuilder: (context, index){

                  return _switchPage(users: users, currentUser: currenuser);
                }
            ),
          )
        ],
      );
    }
   return Center(
     child: CircularProgressIndicator(),
   );
  },
),

    );

  }



  Widget _switchPage({required List<UserEntity>  users, required UserEntity currentUser}){

    switch(_toolBarPageIndex){
      case 0:
        return GroupScreen();
      case 1:
        return UserScreen();
      case 2:
        return ProfileScreen(uid: widget.uid,);
      default:
        return Container();

    }
  }

}


