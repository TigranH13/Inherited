import 'package:flutter/material.dart';

import 'package:inherited/provider.dart';
import 'package:inherited/first_screen.dart';

import 'model.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalcModel>(
      model: CalcModel(),
      child: const MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}


