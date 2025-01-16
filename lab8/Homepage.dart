import 'package:flutter/material.dart';

import 'Aboutpage.dart';
 class Homepage extends StatelessWidget {
   const Homepage({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         body: Center(child: Column(children: [
           Text('Home page', style: TextStyle(color: Colors.black),),
           ElevatedButton(onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(
                   builder: (context) => Aboutpage(name: 'Piyuba',),
                 ));
           },
               child: Text('Go to Homepage')),
         ],
         ),
         )
     );
   }
 }
