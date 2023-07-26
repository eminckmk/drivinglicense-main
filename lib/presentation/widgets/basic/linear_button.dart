import 'package:flutter/material.dart';

import '../../../helpers/custom_colors.dart';

class LinearButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  String buttonText;
  Color buttonColor;
  Color textColor;

  LinearButton(
      {super.key,
        required this.buttonText,
        required this.onPressed,
        this.buttonColor = Colors.white,
        this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: const [CustomColors.darkOrange, CustomColors.lightpink],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: DefaultTextStyle(
              maxLines: 1,
              style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: "regular",),
              child: Text(buttonText),
            )
        ),
      ),
    );
  }
}
