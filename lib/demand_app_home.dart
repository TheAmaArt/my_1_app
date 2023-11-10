import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1_app/src/core/presentation/styles/color_styles.dart';
import 'package:my_1_app/src/core/presentation/widgets/pages/chat_page.dart';
import 'package:my_1_app/src/core/presentation/widgets/pages/option_page.dart';
import 'package:my_1_app/src/core/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class DemandAppHome extends StatefulWidget {
  const DemandAppHome({Key? key}) : super(key: key);
  @override
  DemandAppHomeState createState() => DemandAppHomeState();
}

class DemandAppHomeState extends State<DemandAppHome> {
  int currentIndex = 0;
//instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  //sign user Out
  void signOut() {
    // get Auth Service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: _buildUserList(),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: kPrimaryAppBarColor),
          ),
          title: const Text(
            "Demand_App",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: signOut,
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: _buildUserList(),
        
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(
              label: "Options",
              icon: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage()));
                },
              ),
            ),
            const BottomNavigationBarItem(
              label: "Camera",
              icon: Icon(Icons.camera, color: Colors.black),
            ),
          ],
        ));
  }

  //build a list of Users except for the current logged inn user

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading.....");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((document) => _buildUserListItem(document))
              .toList(),
        );
      }),
    );
  }

  //build individual User list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all user except current user
    if (_auth.currentUser!.email != data["email"]) {
      return ListTile(
        title: Card(
          elevation: 4.0,
          color: Colors.yellow,
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(data["email"]),
            trailing:  IconButton(onPressed: () {} , icon: const Icon(Icons.chat)),
            
          ),
        ),
        onTap: () {
          // pass the cklicked user´s UID to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciverUserEmail: data["email"],
                recieverUserID: data["uid"],
              ),
            ),
          );
        },
      );
    } else {
      //return empty Container
      return Container();
    }
  }
}
