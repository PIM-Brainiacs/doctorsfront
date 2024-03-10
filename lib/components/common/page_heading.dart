import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;

  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/friendship.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSerif',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
