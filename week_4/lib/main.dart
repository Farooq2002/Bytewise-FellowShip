import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Image.network(owlUrl),
        TextButton(
            child: const Text(
              'Show Details',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () => {}),
        Column(
          children: const [
            Text('Type: Owl'),
            Text('Age: 39'),
            Text('Employment: None'),
          ],
        )
      ]),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}
