import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const _kTexts = ['你好!', 'Hello!', 'Bonjour!', 'Hallo!', 'Grützi!'];
const _kTextStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
);

class FifthAnimation extends StatelessWidget {
  const FifthAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Text('TextLiquidFill', style: titleTextStyle),
        TextLiquidFill(
          text: 'LIQUIDY',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.red[100]!,
          textStyle:
              const TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
          boxHeight: 300.0,
        ),
        const Divider(),
        Text('RotateAnimatedTextKit', style: titleTextStyle),
        SizedBox(
          height: 64,
          child: AnimatedTextKit(
            animatedTexts: [
              for (final txt in _kTexts)
                RotateAnimatedText(
                  txt,
                  textStyle: _kTextStyle,
                  textAlign: TextAlign.start,
                ),
            ],
            onTap: () => print("Tap Event"),
            // text: _kTexts,
            repeatForever: true,
          ),
        ),
        const Divider(),
        Text('TypewriterAnimatedTextKit', style: titleTextStyle),
        AnimatedTextKit(
          animatedTexts: [
            for (final txt in _kTexts)
              TypewriterAnimatedText(
                txt,
                textStyle: _kTextStyle,
                textAlign: TextAlign.start,
              )
          ],
        ),
        const Divider(),
        Text('FadeAnimatedTextKit', style: titleTextStyle),
        SizedBox(
          height: 64,
          child: AnimatedTextKit(
            onTap: () => print("Tap Event"),
            animatedTexts: [
              for (final txt in _kTexts)
                FadeAnimatedText(
                  txt,
                  textStyle: _kTextStyle,
                )
            ],
            repeatForever: true,
          ),
        ),
        const Divider(),
        Text('TyperAnimatedTextKit', style: titleTextStyle),
        AnimatedTextKit(
          onTap: () => print("Tap Event"),
          animatedTexts: [
            for (final txt in _kTexts)
              TyperAnimatedText(
                txt,
                textStyle: _kTextStyle,
                textAlign: TextAlign.start,
              )
          ],
        ),
        const Divider(),
        Text('WavyAnimatedTextKit', style: titleTextStyle),
        SizedBox(
          height: 128,
          child: AnimatedTextKit(
            animatedTexts: [
              for (final txt in _kTexts)
                WavyAnimatedText(
                  txt,
                  textStyle: _kTextStyle,
                  textAlign: TextAlign.center,
                )
            ],
            isRepeatingAnimation: true,
          ),
        ),
        const Divider(),
        Text('ScaleAnimatedTextKit', style: titleTextStyle),
        SizedBox(
          height: 64,
          width: 100,
          child: AnimatedTextKit(
            animatedTexts: [
              for (final txt in _kTexts)
                ScaleAnimatedText(
                  txt,
                  textStyle: _kTextStyle,
                  textAlign: TextAlign.center,
                )
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ],
    );
  }
}
