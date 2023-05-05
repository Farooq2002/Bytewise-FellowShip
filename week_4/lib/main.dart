import 'package:flutter/material.dart';
import 'package:week_4/different_animations/first_animation.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstAnimation()));
            },
            child: const Center(
              child: Hero(
                  tag: 'splash',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 120,
                    backgroundImage: AssetImage('assets/icons/flutter.png'),
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text('Tap on the Photo'),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'HERO ANIMATION',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
