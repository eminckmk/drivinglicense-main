import 'package:flutter/cupertino.dart';

import '../../../helpers/custom_colors.dart';

class ClassicTitleExplanation extends StatelessWidget{
  String topText;
  String bottomText;
  ClassicTitleExplanation({super.key,required this.topText,required this.bottomText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration:  BoxDecoration(
        color: CustomColors.white90,
        borderRadius: const BorderRadius.all(Radius.circular(10.0),),
        border: Border.all(
          color: CustomColors.textColor,
          width: 1, //width of border
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(
            topText,
            style: const TextStyle(color: CustomColors.textColor,fontFamily: "bold",fontSize: 15),
          ),
          const SizedBox(height: 5,),
          Container(
            height: 0.8,
            color: CustomColors.lightGray,
          ),
          const SizedBox(height: 7,),
          Text(
            bottomText,
            style: const TextStyle(color: CustomColors.textColor,fontFamily: "regular",fontSize: 15,height: 1.4),
          )
        ],
      ),
    );
  }

}