import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

Container pageguidness({required String information}) {
  return Container(
    width: 261,
    height: 55,
    child: AppText(
      textAlign: TextAlign.center,
      text: information,
      fontWeight: FontWeight.w500,
      textColor: AppColors.centerGrey,
      fontsize: 12,
    ),
  );
}