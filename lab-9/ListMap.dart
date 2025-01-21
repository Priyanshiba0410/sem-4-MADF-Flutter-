import 'package:flutter/material.dart';

import '../Lab_8/AboutPage.dart';
import '../lab8/Aboutpage.dart';
import 'TabView.dart';

void main()
{
  runApp(List_map());
}


class List_map extends StatefulWidget {
  const List_map({super.key});

  @override
  State<List_map> createState() => _listState();
}

class _listState extends State<List_map> {
  List<Map<String,dynamic>>ListDemo = [
    {"name":"A","Color":Colors.black},
    {"name":"B","Color":Colors.black},
    {"name":"C","Color":Colors.black},
    {"name":"D","Color":Colors.black},
    {"name":"E","Color":Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
          appBar: AppBar(
            title: Text("List View"),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(),
                    Text("Drawer Data"),
                  ],
                ),),
                ListTile(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Aboutpage(name: "Shreeya",),
                      ));
                },
                  leading: Icon(Icons.person),
                  title: const Text(' My Profile '),
                ),
                ListTile(onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Tabview(),
                      ));
                },
                  leading: Icon(Icons.mail),
                  title: const Text(' My Email '),
                ),
                ListTile(onTap: (){
                  Navigator.pop(context);
                },
                  leading: Icon(Icons.phone),
                  title: const Text(' My Phone no. '),
                ),

              ],
            ),
          ),
          body: ListView.builder(
            itemCount: ListDemo.length, itemBuilder: (context, index) {
            return Padding(padding: const EdgeInsets.all(8.0),
              child: Container(

                  height: 400,
                  width: 200,
                  decoration: BoxDecoration(
                      color: ListDemo[index]['Color'],
                      border: Border.all()
                  ),
                  child: Center(child: Text(ListDemo[index]['name']))
              ),
            );
          },),
        )
    );
  }
}