import 'package:drivinglicense/data/client/modal/topic.dart';
import 'package:drivinglicense/presentation/routes/lesson/topic_bottom_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/client/datas/topic_datas.dart';
import '../../../helpers/custom_colors.dart';
import '../../widgets/basic/back_button.dart';
import 'all_topic.dart';

final selectedTopic = StateProvider<TopicModel>((ref) {
  return topicList![0];
});

class Lesson extends ConsumerWidget {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
                CustomColors.darkOrange,
                CustomColors.lightpink
            ]),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 10,),
          CustomBackButton(leftPadding: 20,),
          const SizedBox(height: 10,),
          const AllTopic(),
          const SizedBox(height: 20,),
          TopicBottomList()
        ],
      ),
    );
  }
}