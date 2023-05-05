import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:week_4/different_animations/third_animation.dart';

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({Key? key}) : super(key: key);

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lottie Animation'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Lottie Animation',
                style: TextStyle(fontSize: 30),
              ),
              GestureDetector(
                onTap: () {
                  if (!clicked) {
                    clicked = true;
                    _controller.forward();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdAnimation()));
                  } else {
                    clicked = false;
                    _controller.reset();
                  }
                },
                child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_8bF3JcdzIS.json',
                    controller: _controller),
              ),
              const Text(
                'Double tap the logo',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
