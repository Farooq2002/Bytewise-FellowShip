import 'package:bytewise_week_01/providers/auth_provider.dart';
import 'package:bytewise_week_01/providers/count_provider.dart';
import 'package:bytewise_week_01/providers/example_one_provider.dart';
import 'package:bytewise_week_01/providers/favorite_provider.dart';
import 'package:bytewise_week_01/providers/theme_changer.dart';
import 'package:bytewise_week_01/screens/week_01_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'State Management',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.teal,
              ),
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: const WeekOneTask(),
            );
          },
        ));
  }
}
