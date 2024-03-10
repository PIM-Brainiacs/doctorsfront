import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Doctor {
  final String name;
  final String specialty;

  Doctor({required this.name, required this.specialty});
}

class MyApp extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(name: 'Dr. Smith', specialty: 'Cardiologist'),
    Doctor(name: 'Dr. Johnson', specialty: 'Dermatologist'),
    Doctor(name: 'Dr. Davis', specialty: 'Pediatrician'),
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Backoffice',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Backoffice'),
        ),
        body: DoctorList(doctors: doctors),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorList({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(doctors[index].name),
          subtitle: Text(doctors[index].specialty),
          onTap: () {
            // Navigate to the doctor details/editing page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorDetails(doctor: doctors[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class DoctorDetails extends StatelessWidget {
  final Doctor doctor;

  DoctorDetails({required this.doctor});

  @override
  Widget build(BuildContext context) {
    // Implement the doctor details/editing UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${doctor.name}'),
            Text('Specialty: ${doctor.specialty}'),
            // Add input fields for editing details if needed
          ],
        ),
      ),
    );
  }
}
