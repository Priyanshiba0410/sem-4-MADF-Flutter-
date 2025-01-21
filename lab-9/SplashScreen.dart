import 'dart:async';
import 'package:flutter/material.dart';

import '../lab8/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListMap.dart';
import 'ListView.dart';
import 'TabView.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> List_map()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network("https://images.unsplash.com/photo-1689852501130-e89d9e54aa41?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5zdGFncmFtJTIwbG9nb3xlbnwwfHwwfHx8MA%3D%3D",
          height: 500,
          width: 300,
        ),
      ),
    );
  }
}

