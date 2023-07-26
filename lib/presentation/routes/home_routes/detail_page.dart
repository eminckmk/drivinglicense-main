import 'package:drivinglicense/helpers/go_to_methods.dart';
import 'package:drivinglicense/presentation/widgets/basic/back_button.dart';
import 'package:drivinglicense/presentation/widgets/basic/classic_button.dart';
import 'package:flutter/material.dart';
import '../../../data/client/modal/linear_category_model.dart';

class DetailPage extends StatefulWidget {
  LinearCategoryModel model;

  DetailPage({super.key, required this.model});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: [
              widget.model.linearColorRight,
              widget.model.linearColorLeft
            ],
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomBackButton(),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(
                  right: widget.model.imageRightPading ? 15 : 5),
              width: height / 2.5,
              height: height / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(widget.model.imageCode),
                ),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 27, fontFamily: "bold", color: Colors.white),
              child: Text(widget.model.categoryBottomText!),
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 15, fontFamily: "regular", color: Colors.white),
              child: Text(widget.model.categoryDetailText!),
            ),
            const SizedBox(
              height: 20,
            ),
            const DefaultTextStyle(
              style: TextStyle(
                  fontSize: 15, fontFamily: "bold", color: Colors.white),
              child: Text("Hazırsanız hadi başlayalım.."),
            ),
            const SizedBox(
              height: 20,
            ),
            ClassicButton(
              onPressed: () {
                GoToMethods().goToLesson(context);
              },
              textColor: widget.model.linearColorLeft,
              buttonText: "Öğrenmeye Başla",
            )
          ],
        ));
  }
}
