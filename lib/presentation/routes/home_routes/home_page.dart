import 'package:drivinglicense/helpers/custom_colors.dart';
import 'package:drivinglicense/helpers/go_to_methods.dart';
import 'package:drivinglicense/presentation/widgets/basic/linear_category.dart';
import 'package:flutter/material.dart';

import '../../../data/client/datas/linear_category_datas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataList = categoryDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(height: 45,),
            topQuestionMark(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return LinearCategory(
                      model: dataList[index],
                    );
                  }),
            )
          ],
        ));
  }

  topQuestionMark() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DefaultTextStyle(
                style: TextStyle(
                  color: CustomColors.textPink,
                  fontFamily: "bold",
                  fontSize: 23,
                ),
                child: Text('Ehliyetim Cepte'),
              ),
              SizedBox(
                height: 1,
              ),
              DefaultTextStyle(
                style: TextStyle(
                    color: CustomColors.lightGray,
                    fontFamily: "regular",
                    fontSize: 18),
                child: Text('Eğitimin en güzel hali'),
              ),
              SizedBox(
                height: 7,
              )
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){GoToMethods().goToAboutTheExam(context);},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: CustomColors.textPink, spreadRadius: 1),
                    ],
                  ),
                  child: const DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "regular",
                        color: CustomColors.textPink),
                    child: Text("Sınav Hakkında ?"),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
    );
  }
}
