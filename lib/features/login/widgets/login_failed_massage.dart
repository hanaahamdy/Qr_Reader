import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code/features/login/data/login_bloc/login_states.dart';

import '../../../core/utils/app_colors.dart';

void loginfailedmassege(LoginStates state) {
  if (state is loginErrorState) {
    if (state.loginModel.status == 0)
      Fluttertoast.showToast(
          msg: state.loginModel.massage!,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.lightGrey);
  }
}