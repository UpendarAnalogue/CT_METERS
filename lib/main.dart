import 'package:flutter/material.dart';
import 'CT_METERS/ct_meters.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  CT_METERS(),
      debugShowCheckedModeBanner: false,
    );
  }
}

 