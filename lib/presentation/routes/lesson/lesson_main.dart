import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonMain extends StatelessWidget {
  LessonMain({super.key});

  List<Widget> allListDesignerWidget = [const Text("dasdadas ")];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: allListDesignerWidget.length,
      itemBuilder: (context, i) {
        return allListDesignerWidget[i];
      },
    );
  }
}
