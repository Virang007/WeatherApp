
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Worker/worker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController searchControlar = new TextEditingController();
@override
  void initState() {
    // postData();
    // startApp();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
Map info = ModalRoute.of(context)?.settings.arguments as Map;
String temp = ((info['temp_val']).toString().substring(0,4));
String icon =info['icon_val'];
String getcity = info['city_val'];
String air =((info['air_val']).toString().substring(0,4));
String hum =info['hum_val'];
String des =info['des_val'];
String main =info['main_val'];
var City_name =["Mumbai","Delhi","Bangalore","Hyderabad","Ahmedabad"];
 final _random = new Random();
 var city = City_name[_random.nextInt(City_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: PreferredSize(
      preferredSize:Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.blue,
      ),
       ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 167, 206, 237),Color.fromARGB(255, 79, 179, 237)])
            ),
            child: Column(
              children: [
                Container(
                 
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                       color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if((searchControlar.text).replaceAll(" ", "").isEmpty){
                            print("empty");
                          }else{
                              Navigator.pushReplacementNamed(context, '/loading',arguments: {
                          "search_val":searchControlar.text.toString()
                         });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: Icon(Icons.search,color: Colors.blue,)
                          )),
                      Expanded(
                        child: TextField(
                          controller: searchControlar,
                          decoration: InputDecoration(
                            hintText: "Search  $city",
                            border:InputBorder.none
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)
                        ),
                        padding: EdgeInsets.all(5),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png",),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(" $des",style: TextStyle(fontSize: 20),),
                                Text("$getcity",style: TextStyle(fontSize: 12),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 24 ,vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                         children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.wiThermometer)
                            ],
                          ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("$temp",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                          Text("c",style: TextStyle(fontSize: 30,),)
                          ],
                         )
                         ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                            margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
                            height: 200,
                          padding: EdgeInsets.all(20),
                          child:Column(
      
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [ Icon(WeatherIcons.wiDayWindy),],
                             ),SizedBox(height: 20,),
                              Text('$air',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Km/Hr",style: TextStyle(fontSize: 12,),)
                            ],
                          ),
                        ),
                    ),Expanded(
                      child: Container(
                         
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                          ),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            height: 200,
      
                          padding: EdgeInsets.all(20),
                          child:Column(
      
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [ Icon(WeatherIcons.wiHumidity),],
                             ),SizedBox(height: 20,),
                              Text('$hum',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("percent",style: TextStyle(fontSize: 12,),)
                            ],
                          ),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 70,),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by virang"),
                      Text("Data Provide by OpenWethermap.org")
                    ],
                  )),
                
              ],
            ),
          )),
      )
    );
  }
}