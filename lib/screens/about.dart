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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Software Engineering Project Work',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                // fontSize: 19
                letterSpacing: 5
              ),
            ),
            SizedBox(height: 19),
            Text('REPORT CARD GENERATOR',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                // fontSize: 19
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
              ),)
          ],
        ),
      ),
    );
  }
}
