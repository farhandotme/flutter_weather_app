import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: weather_app(),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
