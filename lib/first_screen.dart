import 'package:flutter/material.dart';
import 'package:inherited/provider.dart';
import 'package:inherited/second_screen.dart';

import 'model.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summ = context.watch<CalcModel>().sumResult ?? 0;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) =>
                    context.read<CalcModel>().secondNumber = value),
            const SizedBox(
              height: 15,
            ),
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context.read<CalcModel>()?.firstNumber = value;
                }),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => context.read<CalcModel>()?.summm(),
              child: const Text('sum'),
            ),
            Text(
              summ.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: const Text(
                'navigate',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
