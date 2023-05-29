import 'package:bytwise_week02/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool loading = false;
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(height: 30),
            RoundButton(
              loading: loading,
              title: 'Change Password',
              onPress: () {
                setState(() {
                  loading = true;
                });
                auth
                    .sendPasswordResetEmail(email: emailController.text)
                    .then((value) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage('We have sent email');
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(error.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
