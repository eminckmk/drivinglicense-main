import 'package:drivinglicense/helpers/go_to_methods.dart';
import 'package:drivinglicense/presentation/widgets/basic/linear_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lesson_selection.dart';

final opacityLevel = StateProvider<double>((ref) {
  return 1.0;
});

class TopicBottomList extends ConsumerWidget {
  TopicBottomList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedOpacity(
        opacity: ref.watch(opacityLevel),
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: ref.watch(selectedTopic).list.length,
              itemBuilder: (context, i) {
                return unitDetailListWidget(ref.watch(selectedTopic).list[i],ref,context);
              },
          ),
        ),
      ),
    );
  }


  unitDetailListWidget(String buttonLabel,WidgetRef ref,BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(bottom: 10,top: 10),
        child: LinearButton(buttonText: buttonLabel, onPressed: () {GoToMethods().goToLessonMain(context, buttonLabel);},
        )
    );
  }


}