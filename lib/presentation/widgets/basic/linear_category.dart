import 'package:flutter/material.dart';
import '../../../data/client/modal/linear_category_model.dart';
import '../../../helpers/go_to_methods.dart';

class LinearCategory extends StatelessWidget {

  LinearCategoryModel model;

  LinearCategory(
      {super.key,
      required this.model});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height / 12.0, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 5.0)
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                  colors: [model.linearColorLeft, model.linearColorRight],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){GoToMethods().goDetailPage(model, context);},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  enableFeedback: false,
                ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 10, left: 10, bottom: 10),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Visibility(
                                  visible: true,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "regular",
                                    color: Colors.white),
                                child: Text(model.categoryTopText!),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontFamily: "bold",
                                    color: Colors.white),
                                child: Text(model.categoryBottomText!),
                              ),
                            ],
                          )),
                    ])),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: model.imageRightPading ? 15 : 5),
            width: height / 5.0,
            height: height / 5.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(model.imageCode),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
