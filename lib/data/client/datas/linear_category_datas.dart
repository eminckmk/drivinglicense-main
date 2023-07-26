import 'package:drivinglicense/data/client/modal/linear_category_model.dart';
import 'package:drivinglicense/helpers/go_to_methods.dart';
import '../../../helpers/custom_colors.dart';

List<LinearCategoryModel> categoryDataList = [
  LinearCategoryModel(
      categoryTopText: 'Henüz başlanmadı',
      categoryBottomText: 'Konular',
      categoryDetailText: 'Uzman kadro tarafından titizlikle hazırlanan bu alan eğitiminizi en hızlı ve kaliteli halde öğrenmeniz için tasarlandı.',
      linearColorLeft: CustomColors.lightpink,
      linearColorRight: CustomColors.darkOrange,
      imageCode: "assets/images/teacher.png",
      imageRightPading: true),
  LinearCategoryModel(
      categoryTopText: 'Henüz başlanmadı',
      categoryBottomText: 'Çıkmış Sorular',
      categoryDetailText: 'Önceden çıkmış soruları çözmek sınavda sizi bir adım daha öne taşıyacaktır. Soruların doğru cevaplarını anında öğrenebileceğiniz alandasınız.',
      linearColorLeft: CustomColors.darkBlue,
      linearColorRight: CustomColors.cyan,
      imageCode: "assets/images/pencil.png"),
  LinearCategoryModel(
      categoryTopText: 'Henüz başlanmadı',
      categoryBottomText: 'Denemeler',
      categoryDetailText: 'Çıkmış ve çıkması muhtemel soruları sınavdan önce çözüp kendinizi zamana karşı test etmek isterseniz doğru yerdesiniz.',
      linearColorLeft: CustomColors.purple,
      linearColorRight: CustomColors.pink,
      imageCode: "assets/images/magicbook.png")
];
