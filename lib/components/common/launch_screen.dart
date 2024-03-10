import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';



class LaunchScreen  extends StatefulWidget {
  static const String routeName = '/splash'; 

  const LaunchScreen ({super.key});

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen > {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 245, 186, 115),
          ),
          Center(
            child: Image.asset(
              "assets/images/splash.png",
              width: screenWidth,
              height: MediaQuery.of(context).size.height, 
            ),
          ),
        ],
      ),
    );
  }
}