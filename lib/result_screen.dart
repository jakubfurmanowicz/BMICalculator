import 'package:bmi_calculator/calculator_bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  CalculateBMI calculateBMI = CalculateBMI();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
            minHeight: double.infinity, minWidth: double.infinity),
        decoration: const BoxDecoration(color: Color(0xff423e3e)),
        child: Column(
          children: [AppBar()],
        ),
      ),
    );
  }
}
