import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authentication {
  static Future<bool> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          SaveNewUserToDB(
              mail: email,
              pass: password,
              uid: value.user!.uid,
              name: name,
              phone: phone);
        }
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    }
  }

  static Future login2(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> SaveNewUserToDB(
      {required String mail,
      required String pass,
      required String uid,
      required String name,
      required String phone}) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      'name': name,
      'email': mail,
      'password': pass,
      'UID': uid,
      'phoneNumber': phone
    });
  }

  static Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => login()), (route) => false);
  }
}
