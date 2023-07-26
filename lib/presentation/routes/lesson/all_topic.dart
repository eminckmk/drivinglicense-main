
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/client/datas/topic_datas.dart';
import '../../../helpers/custom_colors.dart';
import '../../../utils/topic_selecter.dart';

class AllTopic extends ConsumerWidget {
  const AllTopic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TopicSelecter(
      showDots: false,
      itemCount: topicList!.length,
      itemBuilder: (index, selectedIndex) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: index == selectedIndex
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 5),
                    child: AnimatedDefaultTextStyle(
                      style: index == selectedIndex
                          ? const TextStyle(
                          color: CustomColors.textColor,
                          fontFamily: "bold",
                          fontSize: 20)
                          : const TextStyle(
                          color: CustomColors.textColor,
                          fontFamily: "bold",
                          fontSize: 8),
                      duration: const Duration(milliseconds: 320),
                      child: Center(
                        child: Text(
                          topicList[index].topicText,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: index == selectedIndex
                        ? const EdgeInsets.only(top: 10)
                        : const EdgeInsets.only(top: 15),
                    child: AnimatedDefaultTextStyle(
                      style: index == selectedIndex
                          ? const TextStyle(
                          color: CustomColors.textColor,
                          fontFamily: "bold",
                          fontSize: 12)
                          : const TextStyle(
                          color: CustomColors.textColor,
                          fontFamily: "bold",
                          fontSize: 8),
                      duration: const Duration(milliseconds: 320),
                      child: Center(
                        child: Text(
                          topicList[index].bottomText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}