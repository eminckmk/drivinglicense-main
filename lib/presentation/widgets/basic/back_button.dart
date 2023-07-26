import 'package:flutter/material.dart';

import '../../../helpers/custom_colors.dart';

class CustomBackButton extends StatelessWidget {

  double leftPadding;
  CustomBackButton({super.key,this.leftPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:leftPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: FloatingActionButton.small(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {Navigator.pop(context, true);},
          child: const Icon(
            Icons.keyboard_backspace_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

