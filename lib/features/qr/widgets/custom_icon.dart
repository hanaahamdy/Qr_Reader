import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

Widget customIcon({required IconData icon,double?borderWidth}) {
  return Container(
    width: 39,
    height: 39,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor,width: borderWidth==null?4:borderWidth),
        borderRadius: BorderRadius.circular(10)),
    child: Icon(
      icon,
      color: AppColors.primaryColor,
    ),
  );
}
