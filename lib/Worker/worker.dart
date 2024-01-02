import 'dart:convert';

import 'package:http/http.dart' as http;


class worker{
  String? Location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String?  main;
  String? icon;

//const pass named paramiters
worker({this.Location}){
  Location = this.Location;

}

  Future<void> getData()async{
//  Response response = await get("https://mytimeapi.herokuapp.com/time/Asia/Kolkata");
//     var data = await json.decode(json.encode(response.body.toString()));
//     // Map data = jsonDecode(response.body);
//      print("$data");

try{
  var url =Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$Location&appid=key");
var response = await http.get(url);
// print(response.body.toString());
Map data = jsonDecode(response.body);
// print(data);

//get temp/Humidity
Map temp_data = data['main'];
Map wind = data["wind"];
double  getTemp = temp_data['temp']-273.15;

double getAir_speed = wind['speed']/0.27777777777778;
String getHumidity = temp_data['humidity'].toString();


//get decsription
List weather_data = data['weather'];
Map weather_main_data = weather_data[0];

String getMain_des = weather_main_data['main'];
String getDesc = weather_main_data['description'];

//get icon

String geticon = weather_main_data["icon"].toString();
// print(icon);
// print(weather_data);
// print(weather_main_data['main']);

 
 //assining values
 temp = getTemp.toString();
 humidity = getHumidity;
 air_speed = getAir_speed.toString();
 description = getDesc;
 main = getMain_des;
 icon = geticon;
}
catch(e){
  temp = "Na  ".toString();
 humidity = "Na  ";
 air_speed = "Na  ";
 description ="Na";
 main = "Na";
 Location ="Na";
 icon ="01d";
}
 }


//  void postData()async{
//   var url = Uri.parse("https://reqres.in/api/login");
//   var data = {
    
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
//   };

//   var response = await http.post(url,body: data);
//   print(response.body.toString());

//  }
}