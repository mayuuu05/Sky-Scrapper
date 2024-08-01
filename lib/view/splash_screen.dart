import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 7), () async {
      Navigator.of(context).pushReplacementNamed('/search');
    });
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff152C3E),
        body: Center(child: Image.asset('assets/images/e17003d3a86823bea8a48e4ec03d33e9.gif',fit: BoxFit.cover,)),
      ),
    );
  }
}
