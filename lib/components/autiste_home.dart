import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutistePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Brainiacs Games"),
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
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
               // Navigator.pushNamed(context, RouteName.AutisteList);
              },
            ),
           ListTile(
             leading: Icon(Icons.logout),
      title: Text('Log Out'),
      onTap: () async {
        // Supprimer les informations d'identification de l'utilisateur
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('userToken'); // Supprime le token de connexion
        
        // Rediriger vers la page de connexion
        GoRouter.of(context).go('/login'); // Navigation via GoRouter
        
        // Si vous utilisez Navigator au lieu de GoRouter
        // Navigator.pushReplacementNamed(context, '/login');
      },
    )
           
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            
          ),
           ],
        onTap: (index) {
          switch (index) {
            case 0:
              GoRouter.of(context).go('/home'); // Navigate to Home
              break;
            case 1:
              GoRouter.of(context).go('/chat_page'); // Navigate to Games
              break;
            case 2:
              GoRouter.of(context).go('/chat_page'); // Navigate to Chat
              break;
          }
        },
        
        selectedItemColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Jeux Éducatifs",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildGameCard(context, "Jeu de Mémoire", "assets/memory_game.png"),
            _buildGameCard(context, "Jeux de Couleurs", "assets/color_game.png"),
            SizedBox(height: 16.0),
            Text(
              "Jeux Créatifs",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildGameCard(context, "Jeu de Dessin", "assets/friendship2.png"),
            _buildGameCard(context, "Jeu de Peinture", "assets/painting_game.png"),
            SizedBox(height: 16.0),
            Text(
              "Jeux Sensoriels",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildGameCard(context, "Jeu de Sons", "assets/sound_game.png"),
            _buildGameCard(context, "Jeu de Lumières", "assets/light_game.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String title, String assetPath) {
    return Card(
      child: ListTile(
        leading: Image.asset(assetPath, width: 50, height: 50),
        title: Text(title),
        onTap: () {
          // Code pour lancer le jeu
        },
      ),
    );
  }
}
