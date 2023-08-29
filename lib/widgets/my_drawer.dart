import 'package:flutter/material.dart';

import '../screens/about.dart';
import '../screens/generator_screen.dart';
import '../screens/display_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(600)),
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          SizedBox(height: 180),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text('Home Screen'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(GeneratorScreen.routeName);
            },
          ),

           ListTile(
            
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.list,
                color: Theme.of(context).primaryColor,

              ),
            ),
            title: Text('List of Report Cards'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FetchDataScreen.routeName);
            },
          ),

           ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,

              ),
            ),
            title: Text('About'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(About.routeName);
            },
          ),


        ],
      ),
    );
  }
}
