import 'package:flutter/material.dart';

class Squareusingflex extends StatelessWidget {
  const Squareusingflex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(flex:2,child: Container(color: Colors.red,)),
                Expanded(flex:3,child: Container(color: Colors.purple,)),
                Expanded(child: Container(color: Colors.pink,))
              ],
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green,)),
                  Expanded(flex: 2, child: Container(color: Colors.orange,)),
                  Expanded(child: Container(color: Colors.black,))
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.yellow,)),
                  Expanded(flex: 2, child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.amber,))
                ],
              )
          )
        ],
      ),

    );
  }
}