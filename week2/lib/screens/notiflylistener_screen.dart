import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notify listener'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
            print(_counter.value);
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: toggle.value,
                      decoration: InputDecoration(
                          hintText: 'password',
                          suffixIcon: InkWell(
                              onTap: () {
                                toggle.value = !toggle.value;
                              },
                              child: Icon(toggle.value
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  );
                }),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  }),
            ),
          ],
        ));
  }
}
