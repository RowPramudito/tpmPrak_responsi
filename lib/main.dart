import 'package:flutter/material.dart';
import 'package:tpm_prak_responsi/pages/main_page.dart';

// Code By:
// Rowang Pramudito
// 123200098 - IF-H

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piala Dunia 2022',
      home: MainPage(),
    );
  }
}

