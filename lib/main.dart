import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class Calculate {
//   String hight = '';
//   String weight = '';
//
//   void CalculateBMI() {
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _hightOfBodyController = TextEditingController();
  final TextEditingController _weightOfBodyController = TextEditingController();
  String _result = '';
  String _group = '';

  void calculateBMI() {
    double hight = double.parse(_hightOfBodyController.text) / 100;
    double weight = double.parse(_weightOfBodyController.text);

    if (_hightOfBodyController.text.isNotEmpty ||
        _weightOfBodyController.text.isNotEmpty) {
      double result = weight / (hight * hight);
      if (result < 16) {
        _result = result.toStringAsFixed(2);
        _group = 'wygłodzenie';
      } else if (result >= 16 && result < 17) {
        _result = result.toStringAsFixed(2);
        _group = 'wychudzenie';
      } else if (result >= 17 && result < 18.6) {
        _result = result.toStringAsFixed(2);
        _group = 'niedowaga';
      } else if (result >= 18.6 && result < 25) {
        _result = result.toStringAsFixed(2);
        _group = '(waga prawidłowa)';
      } else if (result >= 25 && result < 30) {
        _result = result.toStringAsFixed(2);
        _group = 'nadwaga';
      } else if (result >= 30 && result < 35) {
        _result = result.toStringAsFixed(2);
        _group = 'otyłość I stopnia';
      } else if (result >= 35 && result < 40) {
        _result = result.toStringAsFixed(2);
        _group = 'otyłość II stopnia';
      } else if (result >= 40) {
        _result = result.toStringAsFixed(2);
        _group = 'otyłość III stopnia';
      }
    } else {
      _result = 'Wpisz prawidłową wartość';
      _group = '';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Text('Wpisz wzrost w cm:',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400)),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            SizedBox(
                width: 150,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _hightOfBodyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            const Text('Wpisz wagę w kg:',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400)),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            SizedBox(
              width: 150,
              child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: _weightOfBodyController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text(
                'Oblicz BMI',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 7.5)),
            Text('Twoje BMI wynosi: $_result',
                style: const TextStyle(color: Colors.white, fontSize: 15)),
            const Padding(padding: EdgeInsets.only(bottom: 3)),
            Text(_group,
                style: const TextStyle(color: Colors.white, fontSize: 15))
          ],
        ),
      ),
    );
  }

// void przypisz() {
//   calculate.hight = _hightOfBodyController.text;
//   calculate.weight = _weightOfBodyController.text;
//   setState(() {});
// }
}
