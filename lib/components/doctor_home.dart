import 'package:flutter/material.dart';
import 'package:login_signup/components/chat_page.dart';
import 'package:login_signup/components/chat_page.dart';
import 'package:login_signup/components/rendez_vous_page.dart';

import 'chat_page.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DoctorPage> {
  int _currentIndex = 0; // Index de la barre de navigation inférieure

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: const Center(child: Text('Welcome To Brainiacs')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff764abc),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400',
                ),
              ),
              accountName: Text('Amal Souli'),
              accountEmail: Text('amal.souli@esprit.tn'),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Brainiacs'),
             
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
               // Navigator.pushNamed(context, RouteName.AutisteList);
              },
            ),
           
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          const SizedBox(height: 15),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: 'Autiste List',
            
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_long_outlined),
            label: 'Rendez_vous',
          ),
        ],
        selectedItemColor: const Color(0xff764abc), // Couleur de l'élément sélectionné
      ),
    );
  }
}
