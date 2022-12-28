import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/app_text_style.dart';
import 'package:qr_code/core/utils/images_routes.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_cubit.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_statets.dart';

import '../../login/widgets/build_app_button.dart';
import '../widgets/custom_icon.dart';
import '../widgets/page_guidness.dart';
import '../widgets/page_top_line.dart';
import '../widgets/scannerListResult.dart';
import '../widgets/success_code_uploaded.dart';

class QrResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrBloc, QrStates>(
      listener: (context, state) {
        SuccessCodeUploade(state);
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
                    padding:
                        const EdgeInsets.only(right: 23, top: 31, left: 31),
                    child: Column(
                      children: [
                        pageTopLine(),
                        Align(
                            alignment: Alignment.topRight,
                            child:
                                customIcon(icon: Icons.skip_previous_outlined)),
                        SizedBox(
                          height: 27,
                        ),
                        AppText(
                          text: "Scanning Result",
                          fontsize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        pageguidness(
                          information:
                              "Proreader will Keep your last 10 days history to keep your all scared history please purched our pro package",
                        ),
                        Expanded(
                            child: Container(
                          child:
                              ScannerListResult(codeList: cubit.qrModel!.data!),
                        )),
                        SizedBox(
                          height: 31,
                        ),
                        Container(
                          width: double.infinity,
                          height: 54,
                          child: ConditionalBuilder(
                            condition: state is! PostCodeLoadingtates,
                            builder: (BuildContext context) {
                              return DefaultButton(
                                  buttonAction: () {
                                    cubit.postScanCodes();
                                  },
                                  buttonLabel: "Send");
                            },
                            fallback: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 56,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }


}
