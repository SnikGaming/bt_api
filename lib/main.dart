
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main(List<String> args) {
  runApp(YakoApp());
}

class YakoApp extends StatelessWidget {
  @override
  Widget build(BuildContext constext) {
    return MaterialApp(
      title: 'Yako App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
