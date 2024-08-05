import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/constaints.dart';
import 'package:weather_app/screens/homepage_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  static String id = 'homeScreen';

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}


class _HelpScreenState extends State<HelpScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), (){Navigator.pushReplacementNamed(context, HomepageScreen.id);});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('We show weather for you', style: TextStyle(fontFamily: 'Rye', fontWeight: FontWeight.bold),), centerTitle: true,),
      body:Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
          Center( // Use Center widget to center the content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'We show weather for you',
                  style: TextStyle(fontSize: 20, fontFamily: 'Rye'), // Add styling to Text
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 100), // For adding Space between text and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomepageScreen.id);
                  },
                  style: kDefaultButtonStyle,
                  child: const Text('Skip'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

