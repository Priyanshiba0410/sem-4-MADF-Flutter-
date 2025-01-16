import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({super.key});

  @override
  State<ListviewDemo> createState() => _ListviewState();
}

class _ListviewState extends State<ListviewDemo> {
  List<String>ListDemo=["A","B","C","D"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount:ListDemo.length,itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all()
            ),
            child: Center(child: Text(ListDemo[index])),
          ),
        );
      },)


    );
  }
}
