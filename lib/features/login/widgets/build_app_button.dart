import 'package:flutter/material.dart';
import 'package:qr_code/core/utils/app_colors.dart';

import '../../../core/utils/app_text_style.dart';

ElevatedButton DefaultButton(
    {required VoidCallback buttonAction, required String buttonLabel}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(319, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    onPressed: buttonAction,
    child: AppText(text: buttonLabel,fontsize: 16,fontWeight: FontWeight.w700,),
  );
}
