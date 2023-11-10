import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instance of Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign User in
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      // sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email,
           password: password
           );

        // add a new document for the user in Users collection if it doesnt alredy exicst
         _firestore.collection("users").doc(userCredential.user!.uid).set({
      "uid" : userCredential.user!.uid,
      "email" : email,
    }, SetOptions(merge: true));


      return userCredential;
      // catch any errors
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //create a new User
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //After creating the new User, crate a new Document for the User in the User Collection
    _firestore.collection("users").doc(userCredential.user!.uid).set({
      "uid" : userCredential.user!.uid,
      "email" : email,
    });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign User out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
