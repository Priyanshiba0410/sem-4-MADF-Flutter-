import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  const Square({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red,)),
                Expanded(child: Container(color: Colors.purple,)),
                Expanded(child: Container(color: Colors.pink,))
              ],
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green,)),
                  Expanded(child: Container(color: Colors.orange,)),
                  Expanded(child: Container(color: Colors.black,))
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.yellow,)),
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.amber,))
                ],
              )
          )
        ],
      ),

    );
  }
}