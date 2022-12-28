import 'package:flutter/material.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/app_text_style.dart';

SizedBox customLoginAppbar() {
  return SizedBox(
    height: 210,
    child: Stack(
      children: [
        Positioned(
          left: -37,
          top: -210,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.2),
                shape: BoxShape.circle),
            width: 445,
            height: 406,
          ),
        ),
        Positioned(
          left: 180,
          top: -175,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.2),
                shape: BoxShape.circle),
            width: 342,
            height: 342,
          ),
        ),
        Positioned(
            left: 161,
            top: 126,
            child: Container(
                width: 65,
                height: 29,
                child: AppText(
                  text: "Login",
                  fontsize: 24,
                  fontWeight: FontWeight.w600,
                )))
      ],
    ),
  );
}
