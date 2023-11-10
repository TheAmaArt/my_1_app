import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_1_app/src/core/presentation/widgets/componends/model/message.dart';

class ChatService extends ChangeNotifier {
  //get instanve of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    //construct chat room id from current iuser id and receiver id (sorted to ensure uniquenss)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids ( this ensures the chatroom id is always the same for any pair of people)
    String chatRoomId =
        ids.join("_"); // combine the single string to use as a chatroom id ID

    //add new message to database
    await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //GET MESSAGE
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      String userId, String otherUserId) {
    // constructchat room id from user ids (sorted to ensure it matches the id used when sending messeges)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
