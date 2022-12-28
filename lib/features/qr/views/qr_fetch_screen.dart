import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/app_text_style.dart';
import 'package:qr_code/core/utils/images_routes.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_cubit.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_statets.dart';
import 'package:qr_code/features/qr/views/qr_result_code.dart';

import '../../login/widgets/build_app_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/page_guidness.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrBloc, QrStates>(
      listener: (context, state) {
        if (state is QrSuccesstates) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QrResult()));
        }
      },
      builder: (context, state) {
        QrBloc cubit = QrBloc.get(context);
        return Scaffold(
          backgroundColor: AppColors.black,
          body: Column(
            children: [
              SizedBox(
                height: 101,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 23, top: 31, left: 31),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 5,
                        color: AppColors.line,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: customIcon(icon: Icons.notes)),
                      SizedBox(
                        height: 37,
                      ),
                      AppText(
                        text: "Scan OR code",
                        fontsize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      pageguidness(
                        information:
                            "Place qr code inside the frame to scan please avoid shake to get results quickly",
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Image(
                        image: AssetImage(
                          ImagesRoutes.QrImage,
                        ),
                        height: 150, //180
                        width: 150, //180
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      AppText(
                        text: "Scanning Code ...",
                        textColor: AppColors.darkGrey,
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Container(
                        width: 100,
                        height: 17,
                        child: Row(
                          children: [
                            Icon(
                              Icons.collections,
                              color: AppColors.darkGrey,
                            ),
                            Icon(
                              Icons.blur_linear_rounded,
                              color: AppColors.darkGrey,
                            ),
                            Icon(
                              Icons.flash_on,
                              color: AppColors.darkGrey,
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                          buttonAction: () {
                            cubit.scan();
                          },
                          buttonLabel: "Place Camera Code")
                    ],
                  ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
