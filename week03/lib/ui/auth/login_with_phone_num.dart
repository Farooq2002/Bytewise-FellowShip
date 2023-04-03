import 'package:bytwise_week02/ui/auth/verify_code.dart';
import 'package:bytwise_week02/utils/utils.dart';
import 'package:bytwise_week02/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNum extends StatefulWidget {
  const LoginWithPhoneNum({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNum> createState() => _LoginWithPhoneNumState();
}

class _LoginWithPhoneNumState extends State<LoginWithPhoneNum> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number Login'),
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
                  prefixIcon: Icon(Icons.phone), hintText: '+923'),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundButton(
                loading: loading,
                title: 'Register',
                onPress: () {
                  setState(() {
                    loading = true;
                  });
                  _auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text.trim(),
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCode(
                                      verificationId: verificationId,
                                    )));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().toastMessage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                })
          ],
        ),
      ),
    );
  }
}
