import 'package:flutter/material.dart';
import 'package:livelocation/screen/map_screen.dart';

class LiveLocation extends StatelessWidget {
  const LiveLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Location App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MapScreen(),
    );
  }
}
