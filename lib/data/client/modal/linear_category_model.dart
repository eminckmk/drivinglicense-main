import 'package:flutter/material.dart';

class LinearCategoryModel {
  String categoryTopText;
  String categoryBottomText;
  String categoryDetailText;
  String imageCode;
  Color linearColorLeft;
  Color linearColorRight;
  bool imageRightPading;

  LinearCategoryModel({
    required this.categoryTopText,
    required this.categoryBottomText,
    required this.categoryDetailText,
    required this.linearColorLeft,
    required this.linearColorRight,
    required this.imageCode,
    this.imageRightPading = false,
  });
}
