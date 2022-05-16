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
  String _group = '';
  String _error = '';
  int _age = 23;
  bool _isEnable = true;

  CalculateBMI calculateBMI = CalculateBMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
            minWidth: double.infinity, minHeight: double.infinity),
        decoration:
          const BoxDecoration(color: Colors.black),
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
                          _heightOfBodyController.text,
                          _weightOfBodyController.text);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child:
                        const Text('Oblicz', style: TextStyle(fontSize: 18))),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'BMI wynosi: ${calculateBMI.result.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Twoja grupa: ${calculateBMI.group}',
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
      _age = 17;
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
}

class CalculateBMI {
  double? _height;

  double? _weight;

  double _result = 0;

  String _group = 'waga prawidłowa';

  void calculateYourBmi(String enteredHigh, String enteredWeight) {
    if (enteredHigh.isNotEmpty && enteredWeight.isNotEmpty) {
      double? parsedHeight = double.tryParse(enteredHigh);
      double? parsedWeight = double.tryParse(enteredWeight);

      if (parsedHeight != null && parsedWeight != null) {
        _height = parsedHeight / 100;
        _weight = parsedWeight;
        _result = _weight! / (_height! * _height!);
        
        if (_result < 20) {
          _group = 'niedowaga';
        } else if (_result > 25) {
          _group = 'nadwaga';
        }
      } else {
        _result = 0;
      }
    } else {
      _result = 0;
    }
  }

  String get group => _group;
  double get result => _result;
}
