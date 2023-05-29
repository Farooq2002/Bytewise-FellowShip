import 'package:bytwise_week02/ui/auth/login_screen.dart';
import 'package:bytwise_week02/utils/utils.dart';
import 'package:bytwise_week02/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void SignUp() {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((error) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email)),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Email plz';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: 'password',
                          prefixIcon: Icon(Icons.lock_open)),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Password plz';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            RoundButton(
                loading: loading,
                title: 'Sign Up',
                onPress: () {
                  setState(() {
                    loading = true;
                    //============================== function is created for login above ======================================
                    SignUp();
                  });
                  if (_formKey.currentState!.validate()) {}
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text('Login'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
