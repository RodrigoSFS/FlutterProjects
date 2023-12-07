import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Imagens',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home(),
    debugShowCheckedModeBanner: false //desabilita o banner de debug,

  ));
}
