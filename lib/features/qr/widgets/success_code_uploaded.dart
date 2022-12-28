import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_colors.dart';
import '../data/bloc/Qr_statets.dart';

void SuccessCodeUploade(QrStates state) {
  if (state is PostCodeSuccesstates) {
    Fluttertoast.showToast(
        msg: "Qr Code Uploaded Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppColors.lightGrey,
        textColor: AppColors.primaryColor);
  }
}