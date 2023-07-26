import 'package:drivinglicense/helpers/custom_colors.dart';
import 'package:drivinglicense/presentation/routes/lesson/lesson_main.dart';
import 'package:drivinglicense/presentation/routes/lesson/lesson_selection.dart';
import 'package:flutter/material.dart';

import '../data/client/modal/linear_category_model.dart';
import '../presentation/routes/home_routes/about_the_exam.dart';
import '../presentation/routes/home_routes/detail_page.dart';
import '../presentation/widgets/popups/full_popup.dart';

class GoToMethods {
  goDetailPage(LinearCategoryModel model, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailPage(model: model),
      ),
    );
  }

  goToLesson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const Lesson(),
      ),
    );
  }

  goToAboutTheExam(BuildContext context) {
    return FullPopUp(
        buildContext: context,
        popUpText: "Sınav Hakkında",
        linearCustomColorLeft: CustomColors.darkOrange,
        linearCustomColorRight: CustomColors.pink,
        widget: AboutTheExam( linearCustomColorLeft: CustomColors.darkOrange,
          linearCustomColorRight: CustomColors.pink,));
  }

  goToLessonMain(BuildContext context,String lessonName) {
    return FullPopUp(
        buildContext: context,
        popUpText: lessonName,
        widget: LessonMain());
  }
}