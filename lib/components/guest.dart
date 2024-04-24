import 'package:flutter/material.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  _AutismTestPageState createState() => _AutismTestPageState();
}

class _AutismTestPageState extends State<GuestPage> {
  int _totalScore = 0; // Accumulates scores from games to determine result

  void _playGame1() {
    // Placeholder for Game 1 logic
    // Simulate a score from game 1
    setState(() {
      _totalScore += 20; // Example score increment
    });
  }

  void _playGame2() {
    // Placeholder for Game 2 logic
    setState(() {
      _totalScore += 30; // Example score increment
    });
  }

  void _playGame3() {
    // Placeholder for Game 3 logic
    setState(() {
      _totalScore += 50; // Example score increment
    });
  }

  @override
  Widget build(BuildContext context) {
  
   
     
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome To Brainiacs')),
      body: Center(
        
        child: Column(
          
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Center(
                child: Image(
                  image: AssetImage('images/friendship4.png'),
                  height: 300,
                  width: 300,
                ),
              ),

        
          // Set the background image (wallpaper)
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 106, 178, 209),
              image: DecorationImage(
                image: AssetImage('assets/friendship4.png'), // Your background image
                fit: BoxFit.cover, // Adjust to cover the entire background
              ),
            ),
          ),
            const Text(
              'Test for Autism',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playGame1,
              child: const Text('Game 1'),
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playGame2,
              child: const Text('Game 2'),
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playGame3,
              child: const Text('Game 3'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Show the summary report
                final scorePercentage = (_totalScore / 100) * 100; // Convert to percentage
                _showSummaryDialog(context, scorePercentage);
              },
              child: const Text('Get Report'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSummaryDialog(BuildContext context, double percentage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Result'),
          content: Text('Your score is ${percentage.toStringAsFixed(2)}%.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
