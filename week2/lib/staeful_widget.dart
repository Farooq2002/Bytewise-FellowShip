import 'package:flutter/material.dart';

class StateeFulWidget extends StatefulWidget {
  const StateeFulWidget({Key? key}) : super(key: key);

  @override
  State<StateeFulWidget> createState() => _StateeFulWidgetState();
}

class _StateeFulWidgetState extends State<StateeFulWidget> {
  int x = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFul Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              DateTime.now().toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Center(
              child: Text(
            x.toString(),
            style: const TextStyle(fontSize: 30),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;

          //   print(x);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
