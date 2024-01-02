import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/Worker/worker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String location ="loading ";

  String city = "indore";

   
   String? temp;
   String? hum;
   String? air_speed;
   String? des;
   String?  main;
   String? icon;


void startApp( String city)async{
worker instance = worker(Location:city);
await instance.getData();

temp = instance.temp;
hum = instance.humidity;
air_speed = instance.air_speed;
des = instance.description;
main = instance.main;
icon = instance.icon;

print(main);

Future.delayed(Duration(seconds: 2),(){
  Navigator.pushReplacementNamed(context, '/home',arguments: {
  "temp_val":temp,
  "hum_val":hum,
  "air_val":air_speed,
  "des_val":des,
  "main_val":main,
  "icon_val":icon,
  "city_val":city
  
});
});

}
@override
  void initState() {
    // postData();
    // startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Map searchtext = ModalRoute.of(context)?.settings.arguments as Map;
    if(searchtext?.isNotEmpty ?? false){
     city = searchtext['search_val'];
    }
     startApp(city);
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 232, 230),
      body:Center(
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/wAppLogo.png',height: 200,width: 200,),
                    SizedBox(height: 30,),
                    Text("WeatherApp",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                     SizedBox(height: 8,),
                    Text("Develop by virang",style: TextStyle(fontWeight: FontWeight.w500),),
                     SizedBox(height: 20,),
                    SpinKitWave(
                    color: Colors.black,
                    size: 30.0,
                  ),
                  ],
                ),
              ),
          ),
        )
    );
  }
}