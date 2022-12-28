import 'package:flutter/material.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/app_text_style.dart';
import 'package:qr_code/features/qr/widgets/custom_icon.dart';

import '../data/models/qr_model.dart';

ListView ScannerListResult({required List<Data> codeList}) {
  return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 8,
        );
      },
      itemCount:codeList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            child: Row(
              children: [
                customIcon(icon: Icons.description_outlined, borderWidth: 2.5),
                SizedBox(
                  width: 34,
                ),
                AppText(
                  text: "${codeList[index].code}",
                  fontsize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          width: 305,
          height: 75,
          decoration: BoxDecoration(
              color: AppColors.listViewItemColor,
              borderRadius: BorderRadius.circular(11)),
        );
      });
}

