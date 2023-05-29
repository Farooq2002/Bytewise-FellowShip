import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String postId = const Uuid().v1();
  Future<String> uploadPost(String description, Uint8List file, String uId,
      String userName, String profImage) async {
    String res = "some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('post', file, true);
      Post post = Post(
          description: description,
          uid: uId,
          username: userName,
          postId: postId,
          datePublished: DateTime.now().toString(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      _firestore.collection('post').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
  }
}
