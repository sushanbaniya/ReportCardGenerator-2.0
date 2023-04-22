import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class About extends StatelessWidget {
  static const routeName = '/about';

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('About')),
      body: Center(
        child: Text(
          'Software Engineering Project Work',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            // fontSize: 19
            letterSpacing: 5
          ),
        ),
      ),
    );
  }
}
