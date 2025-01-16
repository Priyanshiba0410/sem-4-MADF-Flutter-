import 'package:flutter/material.dart';

class Aboutpage extends StatelessWidget {
  final String name;
  const Aboutpage({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child:Column(children: [
          Text('About Page from student name is ::${name}',style: TextStyle(color: Colors.black,),),

          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          },
              child: Text('Go to Home Page'))
        ],
        ),
        )


    );
  }
}