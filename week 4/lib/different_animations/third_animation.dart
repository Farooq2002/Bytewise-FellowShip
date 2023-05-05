import 'package:flutter/material.dart';

import 'fouth_animation.dart';

class ThirdAnimation extends StatefulWidget {
  const ThirdAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _ThirdAnimationState();
}

class _ThirdAnimationState extends State<ThirdAnimation> {
  double _opacity1 = 1.0, _opacity2 = 1.0, _opacity3 = 1.0;

  Widget _coloredSquare(Color color) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Click on colored squares below to make them invisible, click '
              'once again to make them reappear.',
              style: TextStyle(fontSize: 17),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity1 = 1.0 - _opacity1);
              },
              child: Opacity(
                opacity: _opacity1,
                child: _coloredSquare(Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity2 = 1.0 - _opacity2);
              },
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity2,
                child: _coloredSquare(Colors.green),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity3 = 1.0 - _opacity3);
              },
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity3,
                child: _coloredSquare(Colors.blue),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FourthAnimation()));
                },
                child: const Text('Next Animation '))
          ],
        ),
      ),
    );
  }
}
