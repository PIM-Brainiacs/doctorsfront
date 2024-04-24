import 'package:flutter/material.dart';

class AutisteListPage extends StatefulWidget {
  @override
  _AutisteListPageState createState() => _AutisteListPageState();
}

class _AutisteListPageState extends State<AutisteListPage> {
  List<Map<String, dynamic>> _autistes = [
    {'name': 'Autiste 1', 'age': 10, 'diagnosis': 'Autism Spectrum Disorder'},
    {'name': 'Autiste 2', 'age': 12, 'diagnosis': 'Asperger Syndrome'},
    {'name': 'Autiste 3', 'age': 8, 'diagnosis': 'PDD-NOS'},
  ];

  void _removeAutiste(int index) {
    setState(() {
      _autistes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Autistes"),
        backgroundColor: Color(0xff764abc),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add_autiste'); // Naviguer pour ajouter
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _autistes.length,
        itemBuilder: (context, index) {
          final autiste = _autistes[index];
          return ListTile(
            title: Text(autiste['name']),
            subtitle: Text('Âge : ${autiste['age']}, Diagnostic : ${autiste['diagnosis']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeAutiste(index), // Supprimer un autiste
            ),
            onTap: () {
              Navigator.pushNamed(context, '/autiste_details', arguments: autiste); // Naviguer vers les détails
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_autiste'); // Naviguer pour ajouter
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xff764abc),
      ),
    );
  }
}
