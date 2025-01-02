import 'package:flutter/material.dart';

class form extends StatelessWidget {
  form({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController phono = TextEditingController();

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        title: Text('Home Page', style: TextStyle(color: Colors.black,),),
      ),
      body: Form(
          key: fromKey,

          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter a something';
                  }
                },
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.red),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phono,
                decoration: InputDecoration(
                  hintText: 'Enter your phono',
                  labelText: 'Enter your phono',
                  labelStyle: TextStyle(color: Colors.red),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {
                if(fromKey.currentState!.validate()){
                  print(email.text);
                  print(phono.text);
                }
              }, child: Text('submit'))
            ],
          )
      ),
    );
  }
}