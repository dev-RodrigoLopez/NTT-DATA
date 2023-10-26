
import 'package:flutter/material.dart';

class BotonCustom extends StatelessWidget {
  const BotonCustom({
    Key? key,
    required this.textButton,
    required this.onTap,
    required this.decoration,
    this.widthBoton = 0.8,
    this.heightBoton = 0.07,
    this.fontSize = 20,
    this.textColor = Colors.black,
  }) : super(key: key);

  final String textButton;

  final VoidCallback? onTap;
  final double widthBoton;
  final double heightBoton;
  final double fontSize;
  final BoxDecoration decoration;
  final Color textColor;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return InkWell(
      highlightColor: Colors.white.withOpacity(0.8),
      onTap: onTap,
      child: Container(
        width: size.width * widthBoton,
        height: size.height * heightBoton,
        decoration: decoration,
        child: Center(
          child: Text(
            textButton,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,              
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
