import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1_app/src/core/presentation/styles/color_styles.dart';
import 'package:my_1_app/src/core/presentation/widgets/componends/chat_bubble.dart';
import 'package:my_1_app/src/core/presentation/widgets/componends/my_text_field.dart';
import 'package:my_1_app/src/core/services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String reciverUserEmail;
  final String recieverUserID;
  const ChatPage(
      {super.key,
      required this.reciverUserEmail,
      required this.recieverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieverUserID, _messageController.text);
      //clearing the Controller after sending a message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryAppBarColor),
        ),
        title: Text(widget.reciverUserEmail),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kPrimaryAppBarColor),
        child: Column(children: [
          // messages
          Expanded(
            child: _buildMessageList(),
          ),

          //user input
          _buildMessageInput(),

          const SizedBox(
            height: 25,
          )
        ]),
      ),
    );
  }

  // build message List
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
        widget.recieverUserID,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading..");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //allign the message to the right if the sneder is the current user, otherwise to the left
    var allignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: allignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChatBubble(
          message: data["message"],
          isUser: data["senderId"] == _firebaseAuth.currentUser!.uid,
        ),
      ),
    );
  }

  // building message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          // Textfield
          Expanded(
            child: MyTextfield(
              controller: _messageController,
              hintText: "Enter Message",
              obscureText: false,
            ),
          ),

          // send Button
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
