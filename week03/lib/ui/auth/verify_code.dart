import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;
  const VerifyCode({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone), hintText: '6 digit code'),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundButton(loading: loading, title: 'Verify', onPress: () {})
          ],
        ),
      ),
    );
  }
}
