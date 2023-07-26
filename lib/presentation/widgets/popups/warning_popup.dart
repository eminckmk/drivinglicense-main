import 'package:flutter/material.dart';
import '../../../helpers/custom_colors.dart';
import '../../../helpers/default_strings.dart';
import '../basic/classic_button.dart';

class WaringPopUp {
  ScrollController _controller = ScrollController();

  warningBottomPopUp(BuildContext context, String message) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 30.0),
            child: ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: CustomColors.warningRed,
                    size: 36.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 20),
                  child: Text(
                    DefaultStrings.warning,
                    style: const TextStyle(
                        color: CustomColors.warningRed,
                        fontSize: 16.0,
                        height: 1.2,
                        fontFamily: 'GothamMedium'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20),
                  child: Text(
                    message,
                    style: const TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 16.0,
                        fontFamily: 'GothamBook',
                        height: 1.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: ClassicButton(
                        onPressed: () { Navigator.pop(context); },
                        buttonColor: CustomColors.warningRed,
                        buttonText: "Tamam",
                      )),
                )
              ],
            ),
          );
        });
  }
}
