import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trip_cost/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
 @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 217, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/trip_logo.png"), 
          Text("Sending you to Home Page...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          CircularProgressIndicator(color: const Color.fromARGB(255, 108, 152, 229),)
        ],)
        ),
    );
  }
}