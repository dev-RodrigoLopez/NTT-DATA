// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {


  const Customtextfield({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.error,
  }) : super(key: key);

  final String labelText;
  final Function(String) onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return TextField(
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            const TextStyle(fontSize: 14),
        fillColor: Colors.transparent,
        errorText: error,
        icon: Container(
          height: size.width * 0.15,
          width: size.width * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.lock,
            size: size.height * 0.02,
            color: Colors.black87,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        disabledBorder: const UnderlineInputBorder(),
        errorBorder: const UnderlineInputBorder(),
      ),
    );
  }
}
