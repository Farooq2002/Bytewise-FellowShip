import 'package:bytewise_week_01/screens/dark_theme.dart';
import 'package:bytewise_week_01/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'Example_one.dart';
import 'count_example.dart';
import 'favorite/favourite.dart';
import 'notiflylistener_screen.dart';

class WeekOneTask extends StatefulWidget {
  const WeekOneTask({Key? key}) : super(key: key);

  @override
  State<WeekOneTask> createState() => _WeekOneTaskState();
}

class _WeekOneTaskState extends State<WeekOneTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 01 Intermediate (Flutter)'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'State Management (Provider)',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Example 1 provider',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExampleOne(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Count Example with provider',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountExample(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Favorite feature (Provider)',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteScreen(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Theme Change (Provider)',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DarkThemeScreen(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Hide/show Password ',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotifyListenerScreen(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Stateless widget (Provider)',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              CustomButton(
                title: 'Login Through apis (provider)',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.teal),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
