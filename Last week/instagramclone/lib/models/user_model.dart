import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String email;
  final String password;
  final String uid;
  final String userBio;
  final List followers;
  final List following;
  final String photoUrl;

  User(
      {required this.userName,
      required this.email,
      required this.password,
      required this.uid,
      required this.userBio,
      required this.followers,
      required this.following,
      required this.photoUrl});
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
        "userBio": userBio,
        "followers": followers,
        "following": following,
        "photoUrl": photoUrl,
        "User": uid
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        userName: snapshot['userName'],
        email: snapshot['email'],
        password: snapshot['password'],
        uid: snapshot['uid'],
        userBio: snapshot['userBio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl']);
  }
}
