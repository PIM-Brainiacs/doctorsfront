import 'package:flutter/material.dart';

class RendezVousPage extends StatefulWidget {
  @override
  _RendezVousPageState createState() => _RendezVousPageState();
}

class _RendezVousPageState extends State<RendezVousPage> {
  List<String> _appointments = ["Rendez-vous 1", "Rendez-vous 2", "Rendez-vous 3"];

  void _addAppointment() {
    setState(() {
      _appointments.add("Nouveau rendez-vous"); // Ajouter un rendez-vous
    });
  }

  void _removeAppointment(int index) {
    setState(() {
      _appointments.removeAt(index); // Supprimer un rendez-vous
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rendez-vous"),
        backgroundColor: Color(0xff764abc),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addAppointment, // Ajouter un rendez-vous
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_appointments[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeAppointment(index), // Supprimer un rendez-vous
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAppointment, // Ajouter un rendez-vous
        child: const Icon(Icons.add),
        backgroundColor: Color(0xff764abc),
      ),
    );
  }
}
