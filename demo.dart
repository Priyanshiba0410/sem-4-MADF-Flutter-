import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Navbar"),
      ) ,
      body: Text("Body",style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 50.0

      ),),
      bottomNavigationBar: Text("Bottom",style: TextStyle(
          color: Colors.pinkAccent,
          fontSize: 20.25
      ),),
    );
  }
}