import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'SecondAnimation.dart';

class FirstAnimation extends StatefulWidget {
  const FirstAnimation({Key? key}) : super(key: key);

  @override
  State<FirstAnimation> createState() => _FirstAnimationState();
}

class _FirstAnimationState extends State<FirstAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Hero(
                tag: 'splash',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icons/flutter.png'),
                )),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_1pxqjqps.json',
                controller: _controller, onLoaded: (compos) {
              _controller
                ..duration = compos.duration
                ..forward().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondAnimation()));
                });
            }),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
