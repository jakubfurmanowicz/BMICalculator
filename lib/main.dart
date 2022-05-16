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
  String _result = '';
  String _group = '';
  String _error = '';
  int _age = 23;
  bool _isEnable = true;


  @override
  Widget build(BuildContext context) {
    CalculateBMI calculateBMI = CalculateBMI();

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
            minWidth: double.infinity, minHeight: double.infinity),
        decoration:
        BoxDecoration(gradient: calculateBMI.getGradientByGroup(_group)),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('BMI Calculator',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jaki jest twój wiek?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  children: [
                    Text(_age.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                    Column(
                      children: [
                        TextButton(
                          onPressed: increaseAge,
                          child: const Text('+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)),
                        ),
                        TextButton(
                          onPressed: decreaseAge,
                          child: const Text(
                            '-',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Podaj wagę w kg:',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 3)),
                        SizedBox(
                          width: 150,
                          height: 25,
                          child: TextField(
                              enabled: _isEnable,
                              style: const TextStyle(color: Colors.white),
                              controller: _weightOfBodyController,
                              keyboardType:
                              const TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white54)),
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.only(
                                      left: 5, top: 0, bottom: 0, right: 3))),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(left: 30)),
                    Column(
                      children: [
                        const Text('Podaj wzrost w cm:',
                            style:
                            TextStyle(fontSize: 18, color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 3)),
                        SizedBox(
                          width: 150,
                          height: 25,
                          child: TextField(
                            enabled: _isEnable,
                            style: const TextStyle(color: Colors.white),
                            controller: _heightOfBodyController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.white54)),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(
                                    left: 5, top: 0, bottom: 0, right: 3)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                    onPressed: () {
                      calculateBMI.calculateYourBmi(
                          double.parse(_heightOfBodyController.text),
                          double.parse(_weightOfBodyController.text));
                    },
                    //     () {
                    //   calculateYourBmi(
                    //       double.parse(_heightOfBodyController.text),
                    //       double.parse(_weightOfBodyController.text));
                    // },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child:
                    const Text('Oblicz', style: TextStyle(fontSize: 18))),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'BMI wynosi: ${calculateBMI.calculateYourBmi(double.parse(_heightOfBodyController.text),
                      double.parse(_weightOfBodyController.text))}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Twoja grupa: $_group',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  _error,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void decreaseAge() {
    if (_age == 17) {
      _age = 18;
      _error = 'Dla osób poniżej 18 lat wynik może być nie adekwatny';
      _isEnable = false;
    } else {
      _error = '';
      _age--;
      _isEnable = true;
    }
    setState(() {});
  }

  void increaseAge() {
    if (_age == 130) {
      _age == 130;
      _error = 'Wiek nie może być większy od 130';
      _isEnable = false;
    } else {
      _error = '';
      _age++;
      _isEnable = true;
    }
    setState(() {});
  }

//void calculateYourBmi(double _high, double _weight) {
//  // double weight = double.parse(_weightOfBodyController.text);
//  // double high = double.parse(_heightOfBodyController.text) / 100;
//  double weight = _weight;
//  double high = _high / 100;
//  double result = weight / (high * high);
//  if (_heightOfBodyController.text.isNotEmpty &&
//      _weightOfBodyController.text.isNotEmpty &&
//      weight > 0 &&
//      high > 0) {
//    if (_age >= 18 && _age <= 24) {
//      if (result >= 19 && result <= 24) {
//        _group = 'waga prawidłowa';
//      } else if (result > 24) {
//        _group = 'nadwaga';
//      } else if (result < 19) {
//        _group = 'niedowaga';
//      }
//    } else if (_age >= 25 && _age <= 34) {
//      if (result >= 20 && result <= 25) {
//        _group = 'waga prawidłowa';
//      } else if (result > 25) {
//        _group = 'nadwaga';
//      } else if (result < 20) {
//        _group = 'niedowaga';
//      }
//    } else if (_age >= 35 && _age <= 44) {
//      if (result >= 21 && result <= 26) {
//        _group = 'waga prawidłowa';
//      } else if (result > 26) {
//        _group = 'nadwaga';
//      } else if (result < 21) {
//        _group = 'niedowaga';
//      }
//    } else if (_age >= 45 && _age <= 54) {
//      if (result >= 23 && result <= 28) {
//        _group = 'waga prawidłowa';
//      } else if (result > 28) {
//        _group = 'nadwaga';
//      } else if (result < 23) {
//        _group = 'niedowaga';
//      }
//    } else if (_age >= 55) {
//      if (result >= 24 && result <= 29) {
//        _group = 'waga prawidłowa';
//      } else if (result > 29) {
//        _group = 'nadwaga';
//      } else if (result < 24) {
//        _group = 'niedowaga';
//      }
//    }
//    _result = result.toStringAsFixed(2);
//  } else {
//    _result = '';
//    _group = '';
//  }
//  setState(() {});
//}
}

class CalculateBMI {

  double? height;

  double? weight;

  double? result;

  double? calculateYourBmi(double high, double weight) {
    height = high / 100;
    this.weight = weight;


    result = weight / (high * high);

    return height;
  }

  LinearGradient? getGradientByGroup(String group) {
    if (group == 'wychudzenie' ||
        group == 'niedowaga' ||
        group == 'wygłodzenie') {
      return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff1b1893), Color(0xff4aa9ed)]);
    } else if (group == 'waga prawidłowa' || group.isEmpty) {
      return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff1c9e19), Color(0xff7df24c)]);
    } else if (group == 'nadwaga' ||
        group == 'otyłość I stopnia' ||
        group == 'otyłość II stopnia' ||
        group == 'otyłość III stopnia') {
      return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff6c0b0b), Color(0xffc21919)]);
    }
    return null;
  }
}
