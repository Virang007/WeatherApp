// ignore: unused_import
import 'package:flutter/material.dart';

class mapIndart extends StatefulWidget {
  const mapIndart({super.key});

  @override
  State<mapIndart> createState() => _mapIndartState();
}

class _mapIndartState extends State<mapIndart> {

  Map color ={
    "key":"values"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("$color")),
    );
  }
}