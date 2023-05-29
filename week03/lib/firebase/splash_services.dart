import 'dart:async';

import 'package:bytwise_week02/ui/auth/login_screen.dart';
import 'package:bytwise_week02/ui/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const UploadImage())));
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }
}
