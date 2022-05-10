import 'package:flutter/cupertino.dart';
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
      title: 'Flutter Demo',
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text('kalkulator bmi'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Podaj wagę w kg:',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Container(
              width: 150,
              height: 25,
              child: TextField(
                controller: _weightOfBodyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Text('Podaj wzrost w cm:',
                style: TextStyle(fontSize: 18, color: Colors.black)),
            Container(
              width: 150,
              height: 25,
              child: TextField(
                controller: _heightOfBodyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
                onPressed: CalculateYourBmi,
                style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                child: const Text('Oblicz', style: TextStyle(fontSize: 18))),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              'BMI wynosi: ${_result}\n',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text('$_error')
          ]),
        )));
  }

  void CalculateYourBmi() async{
    String error = 'Wprowadź poprawne wartości';


    if (!_heightOfBodyController.text.isEmpty){
      double weight = double.parse(_weightOfBodyController.text);
      double hight = double.parse(_heightOfBodyController.text) / 100;
      double result = weight / (hight * hight);
      _result = result.toStringAsFixed(2);
      print("nie ok");
    }
    else{
      _error = error;
      print("ok");

    }
    setState(() {});
  }
}
