import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/models/user_model.dart' as model;
import 'package:insta_clone/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//==========================GET USER DATA============================================================
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('user').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

//===============================SIGN UP=========================================================
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String userName,
      required String userBio,
      required Uint8List file}) async {
    String res = 'Some errors occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          userBio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //user to cloud

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePictures', file, false);

        model.User user = model.User(
            userName: userName,
            email: email,
            password: password,
            uid: cred.user!.uid,
            userBio: userBio,
            followers: [],
            following: [],
            photoUrl: photoUrl);
        _firestore.collection('users').doc(cred.user?.uid).set(user.toJson());
        res = "Success";
      }
    } catch (error) {
      res = error.toString();
      print(res);
    }
    return res;
  }

  //==================LOGIN FTN=======================================
  Future<String> loginUser({required String email, required password}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
