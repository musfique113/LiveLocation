import 'package:flutter/material.dart';
import 'package:livelocation/chat_map.dart';
import 'package:livelocation/screens/map.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      //home: GoogleMapScreen(),
      home: MapScreen(),
      //home: HomeScreen(),
    );
  }
}
