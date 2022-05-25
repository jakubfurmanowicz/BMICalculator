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
  const ResultPage({Key? key, required this.result, required this.group}) : super(key: key);

  final String result;
  final String group;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  CalculateBMI calculateBMI = CalculateBMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff423e3e),
      ),
      body: Container(
        constraints: const BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        decoration: const BoxDecoration(color: Color(0xff423e3e)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your BMI',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Image.asset('assets/bmiLogo.png', height: 150, width: 200),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Text(
                widget.result,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
               Text('${widget.group}', style: const TextStyle(color: Color(0xff55dc7f), fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
