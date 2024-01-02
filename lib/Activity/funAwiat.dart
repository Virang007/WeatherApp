import 'package:flutter/material.dart';

class Funawait extends StatefulWidget {
  const Funawait({super.key});

  @override
  State<Funawait> createState() => _FunawaitState();
}

class _FunawaitState extends State<Funawait> {
late String name ;

 GetData() async{
  await Future.delayed(Duration(seconds: 2),(){
   name = "virang" ;
  });
}

void ShowData() async { 
  await GetData();
  
  print(" $name ");
}

@override
  void initState() {
    // TODO: implement initState
    // GetData();
    ShowData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Await function"),
      ),body: Column(),
    );
  }
}