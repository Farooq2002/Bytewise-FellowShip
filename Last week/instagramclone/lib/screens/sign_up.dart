import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/responsive_layout/mobile_screen_layout.dart';
import 'package:insta_clone/responsive_layout/responsive_layout_screen.dart';
import 'package:insta_clone/responsive_layout/webscreen_layout.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/utils.dart';

import '../resources/auth_methods.dart';
import '../widgets/text_field_inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userBioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _userBioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      userName: _userNameController.text,
      userBio: _userBioController.text,
      file: _image!,
    );
    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            websScreenLayout: WebScreenScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.grey,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://i.stack.imgur.com/l60Hf.png'),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: () {
                              selectImage();
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              TextInputField(
                textEditingController: _userNameController,
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                textEditingController: _passwordController,
                hintText: 'Enter your Password',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                textEditingController: _userBioController,
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: blueColor, borderRadius: BorderRadius.circular(4)),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign Up'),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Dont have an account? '),
                  ),
                  InkWell(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
