import 'package:bytewise_week_01/providers/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    final exampleOneProvider =
        Provider.of<ExampleOneProvider>(context, listen: false);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                  max: 1,
                  min: 0,
                  value: exampleOneProvider.value,
                  onChanged: (val) {
                    exampleOneProvider.setValue(val);
                  });
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 70,
                    color: Colors.orange.withOpacity(value.value),
                    child: const Center(child: Text('Container1')),
                  )),
                  Expanded(
                      child: Container(
                    height: 70,
                    color: Colors.deepPurpleAccent.withOpacity(value.value),
                    child: const Center(child: Text('Container1')),
                  ))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
