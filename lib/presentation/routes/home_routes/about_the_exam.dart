import 'package:drivinglicense/data/client/datas/about_the_exam_datas.dart';
import 'package:drivinglicense/helpers/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_styles/classic_title_explantion.dart';

class AboutTheExam extends StatefulWidget {
  Color linearCustomColorLeft;
  Color linearCustomColorRight;

   AboutTheExam({
    super.key,
     this.linearCustomColorLeft = Colors.white,
     this.linearCustomColorRight = Colors.white
  });

  @override
  State<AboutTheExam> createState() => _AboutTheExamState();
}

class _AboutTheExamState extends State<AboutTheExam> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.0, 1.0],
            colors: [widget.linearCustomColorLeft, widget.linearCustomColorRight],
          ),
        ),
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          children: [
            ClassicTitleExplanation(topText: AboutTheExamDatas().topTitle,bottomText:  AboutTheExamDatas().explanatory),
            const SizedBox(height: 10),
            ClassicTitleExplanation(topText:AboutTheExamDatas().docTitle, bottomText:AboutTheExamDatas().docListTitle),
            const SizedBox(height: 10),
            ClassicTitleExplanation(topText:AboutTheExamDatas().payTopTitle, bottomText:AboutTheExamDatas().payTitle),
            const SizedBox(height: 10),
            ClassicTitleExplanation(topText:AboutTheExamDatas().pointTopTitle, bottomText:AboutTheExamDatas().pointTitle),
            const SizedBox(height: 10),
          ],
      )
    );
  }


}
