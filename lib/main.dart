import 'package:flutter/material.dart';

import './widgets/my_drawer.dart';
import './screens/about.dart';
import './screens/generator_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        accentColor: Colors.white,
      ),
      home: HomePage(),
      routes: {
        GeneratorScreen.routeName: (context) => GeneratorScreen(),
        About.routeName: (context) => About(),

      }
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GeneratorScreen();
  }
}
