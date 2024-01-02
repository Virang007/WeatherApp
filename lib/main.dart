import 'package:flutter/material.dart';
import 'package:flutterapp/Activity/funAwiat.dart';
import 'package:flutterapp/Activity/home.dart';
import 'package:flutterapp/Activity/loading.dart';
import 'package:flutterapp/Activity/location.dart';
import 'package:flutterapp/Activity/mapIndart.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      //  "/":(context) => Home(),
      // "/":(context) => Funawait(),
      "/":(context) => Loading(),
      "/home":(context) => Home(),
      "/loading":(context) => Loading(),
      // "/Location":(context) => Location()

      //--no-sound-null-safety
      //dart.flutterAdditionalArgs 
      //flutter build apk --split-per-abi --no-sound-null-safety
    },
  ));
}


