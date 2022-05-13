import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _heightOfBodyController = TextEditingController();
  final TextEditingController _weightOfBodyController = TextEditingController();
  String _result = '';
  String _error = '';
  String _group = 'waga prawidłowa';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: GetGradientByGroup(_group)),
            child: Center(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Podaj wagę w kg:',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 5)),
                    Container(
                      width: 150,
                      height: 25,
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _weightOfBodyController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54)
                              ),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(
                                  left: 5, top: 0, bottom: 0, right: 3))
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text('Podaj wzrost w cm:',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Padding(padding: EdgeInsets.only(bottom: 3)),
                    Container(
                      width: 150,
                      height: 25,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _heightOfBodyController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)
                            ),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(
                                left: 5, top: 0, bottom: 0, right: 3)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                        onPressed: CalculateYourBmi,
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        child:
                        const Text('Oblicz', style: TextStyle(fontSize: 18))),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'BMI wynosi: ${_result}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      'Twoja grupa: ${_group}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text('$_error',
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ]),
                ))));
  }

  LinearGradient? GetGradientByGroup(String _group) {
    if (_group == 'wychudzenie' || _group == 'niedowaga' || _group == 'wygłodzenie') {
      return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [new Color(0xff1b1893), new Color(0xff4aa9ed)]);
    } else if (_group == 'waga prawidłowa') {
      return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [new Color(0xff1c9e19), new Color(0xff7df24c)]);
    } else if (_group == 'nadwaga' ||_group == 'otyłość I stopnia' ||
        _group == 'otyłość II stopnia' ||
        _group == 'otyłość III stopnia') {
      return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [new Color(0xff6c0b0b), new Color(0xffc21919)]);
    }
  }

  void CalculateYourBmi() {
    String error = 'Wprowadź poprawne wartości!';

    if (!_heightOfBodyController.text.isEmpty ||
        !_weightOfBodyController.text.isEmpty) {
      double weight = double.parse(_weightOfBodyController.text);
      double hight = double.parse(_heightOfBodyController.text) / 100;
      double result = weight / (hight * hight);
      if (result < 16) {
        _group = 'wygłodzenie';
      } else if (result >= 16 && result < 17) {
        _group = 'wychudzenie';
      } else if (result >= 17 && result < 18.6) {
        _group = 'niedowaga';
      } else if (result >= 18.6 && result < 25) {
        _group = 'waga prawidłowa';
      } else if (result >= 25 && result < 30) {
        _group = 'nadwaga';
      } else if (result >= 30 && result < 35) {
        _group = 'otyłość I stopnia';
      } else if (result >= 35 && result < 40) {
        _group = 'otyłość II stopnia';
      } else if (result >= 40) {
        _group = 'otyłość III stopnia';
      }
      _result = result.toStringAsFixed(2);
    } else {
      _error = error;
    }
    setState(() {});
  }
}