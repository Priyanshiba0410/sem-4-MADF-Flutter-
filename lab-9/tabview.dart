import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabview extends StatelessWidget {
  const Tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab View"),
          bottom: TabBar(tabs:[
            Tab(text: "First_Page",),
            Tab(text: "Second_Page",),
            Tab(text: "Third_Page",),
          ],
          ) ,
        ),
        body: TabBarView(children: [
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("Tab View"),
                content: Text("First_Page"),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: Icon(CupertinoIcons.back))
                ],
              );
            },
            );
          }, child: Text("Tab View1")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("Tab View"),
                content: Text("Second_Page"),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: Icon(CupertinoIcons.back))
                ],
              );
            },
            );
          }, child: Text("Tab View2")),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("Tab View"),
                content: Text("Third_Page"),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: Icon(CupertinoIcons.back))
                ],
              );
            },
            );
          }, child: Text("Tab View3")),
        ],
        ),
      ),
    );
  }
}
