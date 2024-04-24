
import 'package:flutter/material.dart';
import 'package:login_signup/components/settings_page.dart';
import 'package:login_signup/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column( children: [
             //logo
              DrawerHeader(
                child: Center(
                  child: Icon(Icons.message , color: Theme.of(context).colorScheme.primary,
                  size: 40,
                  ),
                  ),
              ),
            //homelist
             Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: ListTile(
                title: Text(" H O M E"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
               ),
             ),
            //sittings list
            Padding(
               padding: const EdgeInsets.only(left: 25.0),
               child: ListTile(
                title: Text(" S E T T I N G S"),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>SettingsPage(),
                  ),
                  );
                },
               ),
             ),
           ],
           ),

             //logout list tile
             Padding(
               padding: const EdgeInsets.only(left: 25.0, bottom: 25),
               child: ListTile(
                title: Text(" L O G O U T"),
                leading: Icon(Icons.logout),
                onTap: () {AuthService().signOut();},
               ),
             ),

          ],
    ),

    );
  }
}