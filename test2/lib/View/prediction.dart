import 'package:flutter/material.dart';

class prediction extends StatefulWidget {
  const prediction({super.key});

  @override
  State<prediction> createState() => _predictionState();
}

class _predictionState extends State<prediction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text('Sample Test')
          ),
        ),
      ),
    );
  }
}