

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/user_tile.dart';
import 'package:login_signup/components/chat_page.dart';
import 'package:login_signup/services/auth/auth_service.dart';
import 'package:login_signup/components/my_drawer.dart';
import 'package:login_signup/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
//chat service
final ChatService _chatService =ChatService();
final AuthService _authService =AuthService();


//void logout () {
  //get auth service
 // final _auth =AuthService();
  //_auth.signOut();
//}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
       // actions: [
          //logout 
         // IconButton(onPressed: logout, icon: Icon(Icons.logout))
        //],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return  StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final users = snapshot.data?.docs ?? [];

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return UserTile(
              text: user['email'], // Assuming 'username' is a field in your Firestore document
              onTap: () {     Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChatPage( 
            //receiverEmail: user["email"],
           // receiverID: user["uid"],
          ),
        
        ));
      
                
              },
            );
          },
        );
      },
    );
  }
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    print(_authService.getCurrentUser()!.email);
    if (userData["email"] != _authService.getCurrentUser()!.email ) {
      return  UserTile(
      text: userData["email"],
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ChatPage( 
            //receiverEmail: userData["email"],
            //receiverID: userData["uid"],
          ),
        
        ));
      },
    );

    } else {
      return Container();
    }
  }
}
