import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solve_it/consts/colors.dart';
import 'package:solve_it/consts/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: Center(child: Image.asset(logo,color: Colors.white,)),
    );
  }
}
