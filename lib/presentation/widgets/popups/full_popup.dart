import 'package:flutter/material.dart';

import '../../../helpers/custom_colors.dart';

class FullPopUp {
  late double? topPadding;
  final BuildContext buildContext;
  String popUpText;
  Widget widget;
  Color linearCustomColorLeft;
  Color linearCustomColorRight;

  FullPopUp({
    required this.buildContext,
    required this.widget,
    required this.popUpText,
    this.linearCustomColorLeft = Colors.white,
    this.linearCustomColorRight = Colors.white
  }) {
    topPadding = MediaQuery.of(buildContext).padding.top;
    fullPopUp(buildContext);
  }

  fullPopUp(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height - topPadding! - 40,
              child: appBarAndBottomWidget(context));
        });
  }

  appBarAndBottomWidget(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.5,
          pinned: true,
          flexibleSpace: Container(
            color: CustomColors.popUpBackColor,
            child: (Container(
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [linearCustomColorLeft, linearCustomColorRight],
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
            )),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          title: appBar(context),
        ),
        SliverToBoxAdapter(
          child: widget,
        )
      ],
    );
  }

  appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(
                  Icons.close,
                  color: CustomColors.textColor,
                  size: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 10),
            child: Text(
              popUpText,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "bold",
                  color: CustomColors.textColor),
            ),
          ),
          const Expanded(child: Text("")),
        ],
      ),
    );
  }
}
