import 'package:bmi_calculator/bmi_set_age.dart';
import 'package:bmi_calculator/bmi_text_field.dart';
import 'package:bmi_calculator/button_change_color.dart';
import 'package:bmi_calculator/calculator_bmi.dart';
import 'package:bmi_calculator/result_screen.dart';
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
  ChangeButtonColor changeButtonColor = ChangeButtonColor();

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
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    const Padding(padding: EdgeInsets.only(top: 25)),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Who are you?',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    changeButtonColor.firstButtonPressed();
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.male),
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          Color(changeButtonColor.firstColor),
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20)),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 5)),
                                const Text(
                                  'Male',
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(right: 40)),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    changeButtonColor.secondButtonPressed();
                                    setState(() {});
                                  },
                                  child: const Icon(Icons.female),
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          Color(changeButtonColor.secondColor),
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20)),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 5)),
                                const Text(
                                  'Female',
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.white60,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What's your age?",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
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
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.white60,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 30)),
                    Row(
                      children: [
                        BmiTextField(
                            isEnable: true,
                            controller: _weightOfBodyController,
                            label: "What's your weight?"),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        const Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: (Text(
                              'Kg',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 40),
                        ),
                        BmiTextField(
                            isEnable: true,
                            controller: _heightOfBodyController,
                            label: "What's your height?"),
                        const Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: Text(
                              'Cm',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    ElevatedButton(
                        onPressed: () {
                          calculateBMI.calculateYourBmi(
                            _heightOfBodyController.text,
                            _weightOfBodyController.text,
                            setYourAge.age,
                          );
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                result: calculateBMI.result.toStringAsFixed(2),
                                group: calculateBMI.group,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff59d995),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 10, bottom: 10)),
                        child: const Text('Calculate Your BMI',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
