import 'package:flutter/material.dart';

import '../../../helpers/custom_colors.dart';

class ClassicButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String? buttonText;
  Color buttonColor;
  Color textColor;

  ClassicButton(
      {super.key,
      this.buttonText,
      required this.onPressed,
      this.buttonColor = Colors.white,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      height: 65,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child:
            Text(
              buttonText.toString(),
              style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontFamily: 'bold'),
            ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
