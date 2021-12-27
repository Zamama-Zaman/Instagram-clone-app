import 'package:flutter/material.dart';
import 'package:instragram_clone_app/pages/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Instragram Clone App',
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    );
  }
}
