import 'package:bmi_calculator/bmi_set_age.dart';
import 'package:bmi_calculator/bmi_text_field.dart';
import 'package:bmi_calculator/calculate_show_result.dart';
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
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _heightOfBodyController = TextEditingController();
  final TextEditingController _weightOfBodyController = TextEditingController();

  CalculateBMI calculateBMI = CalculateBMI();
  SetYourAge setYourAge = SetYourAge();
  ShowResult showResult = ShowResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            constraints: const BoxConstraints(
                minWidth: double.infinity, minHeight: double.infinity),
            decoration: const BoxDecoration(color: Color(0xff423e3e)),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('BMI Calculator',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.white60,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Jaki jest twój wiek?',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    // const Padding(padding: EdgeInsets.only(top: 8)),
                    Row(
                      children: [
                        Text(setYourAge.age.toString(),
                            style: const TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 25,
                              child: (TextButton(
                                onPressed: () {
                                  setYourAge.increaseAge();
                                  setState(() {});
                                },
                                child: const Text('+',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900)),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                              width: 25,
                              child: (TextButton(
                                onPressed: () {
                                  setYourAge.decreaseAge();
                                  setState(() {});
                                },
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.white60,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 8)),
                    Row(
                      children: [
                        BmiTextField(
                            isEnable: true,
                            controller: _weightOfBodyController,
                            label: 'Podaj wagę w kg:'),
                        const Padding(padding: EdgeInsets.only(left: 100)),
                        BmiTextField(
                            isEnable: true,
                            controller: _heightOfBodyController,
                            label: 'Podaj wzrost w cm:')
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                        onPressed: () {
                          calculateBMI.calculateYourBmi(
                              double.parse(_heightOfBodyController.text),
                              double.parse(_weightOfBodyController.text));
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff32e66a)),
                        child: const Text('Oblicz',
                            style: TextStyle(fontSize: 18))),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'BMI wynosi: ${calculateBMI.result?.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 3)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
