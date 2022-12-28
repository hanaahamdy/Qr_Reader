import 'package:flutter/material.dart';
import 'package:qr_code/features/login/data/login_bloc/login_states.dart';

import '../../qr/views/qr_fetch_screen.dart';

void loginSuccessMassage(LoginStates state, BuildContext context) {
  if (state is loginSuccessState) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => QrScreen()),
            (route) => false);
  }
}