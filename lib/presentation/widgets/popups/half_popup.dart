import 'package:flutter/material.dart';

import '../../../helpers/custom_colors.dart';

class HalfPopUp {

  halfBottomPopUp(BuildContext context, Widget halfPopUpWidget) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
            FractionallySizedBox(
            widthFactor: 0.2, // width of top divider bar
              child: Container(
                height: 5.0,
                margin: const EdgeInsets.only( // margin of top divider bar
                    top: 10
                ),
                decoration: const BoxDecoration(
                  color: CustomColors.lightGray, // color of top divider bar
                  borderRadius: BorderRadius.all(Radius.circular(15.5)),
                ),
              ),
            ),
              halfPopUpWidget,
            ],
          );
        });
  }
}
