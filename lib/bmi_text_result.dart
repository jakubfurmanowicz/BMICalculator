import 'package:flutter/material.dart';

class BmiTextResult extends StatelessWidget {
  const BmiTextResult({Key? key, required this.group, required this.result, required this.error}) : super(key: key);

  final String group;
  final String result;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'BMI wynosi: ${result}',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const Padding(padding: EdgeInsets.only(top: 3)),
        Text(
          'Twoja grupa:\n${group}',
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            error,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
