import 'package:flutter/material.dart';

class Helloworld extends StatelessWidget {
  const Helloworld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home Page', style: TextStyle(color: Colors.black,),),
      ),
      body: Column(children: [
        Text('Hello World..!!',style: TextStyle(color: Colors.black,),),
      ],),
    );
  }
}