import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class tabview extends StatelessWidget {
  const tabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:Scaffold(
          appBar: AppBar(
            title: Text("Tab view"),
            bottom: TabBar(tabs: [
              Tab(text: "First_page",),
              Tab(text: "Second_page",),
              Tab(text: "Third_page",)
            ],
            ),
          ),
          body: TabBarView(children:[
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title:Text("Tab view1") ,
                  content: Text("First_page"),
                  actions: [
                    IconButton(onPressed:(){
                      Navigator.pop(context);

                    } , icon:Icon(CupertinoIcons.back))
                  ],
                );
              },
              );
            }, child: Text("Tab view")),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title:Text("Tab view2") ,
                  content: Text("Second_page"),
                  actions: [
                    IconButton(onPressed:(){
                      Navigator.pop(context);
                    } , icon:Icon(CupertinoIcons.back))
                  ],
                );
              },
              );
            }, child: Text("Tab view")),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title:Text("Tab view3") ,
                  content: Text("Third_page"),
                  actions: [
                    IconButton(onPressed:(){
                      Navigator.pop(context);

                    } , icon:Icon(CupertinoIcons.back))
                  ],
                );
              },
              );
            }, child: Text("Tab view"))

          ],
          ),
        ),
    );
  }
}
