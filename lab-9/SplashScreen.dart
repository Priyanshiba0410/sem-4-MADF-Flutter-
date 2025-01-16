import 'dart:async';
import 'package:flutter/material.dart';

import '../lab8/Homepage.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void Initstate(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Homepage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg'),
        heightFactor:100,
        widthFactor:200,
      ),
    );
  }
}
