import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVIDER'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${DateTime.now().hour}:${DateTime.now().minute}"),
          Center(
              child: Text(
            count.toString(),
            style: const TextStyle(fontSize: 30),
          ))
        ],
      ),
    );
  }
}
