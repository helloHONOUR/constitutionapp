import 'package:constitutionapp/myhomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // colorSchemeSeed: Color.fromRGBO(3, 1, 2, 1),
          textTheme: const TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 15))
          // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          // useMaterial3: true,
          ),
      home: const MyHomePage(),
    );
  }
}
