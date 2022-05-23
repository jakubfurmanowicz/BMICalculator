import 'package:flutter/material.dart';

class BmiTextField extends StatelessWidget {
  const BmiTextField({Key? key, required this.isEnable, required this.controller, required this.label}) : super(key: key);

  final bool isEnable;
  final TextEditingController controller;
  final String label;


  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            )),
        const Padding(padding: EdgeInsets.only(bottom: 3)),
        SizedBox(
          width: 100,
          height: 25,
          child: TextField(
            enabled: isEnable,
            style: const TextStyle(color: Colors.white),
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white)),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white24),
                ),
                contentPadding: EdgeInsets.only(
                    left: 5, top: 0, bottom: 0, right: 3)),
          ),
        ),
      ],
    );
  }
}
