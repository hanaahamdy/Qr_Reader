import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/features/login/widgets/build_app_button.dart';

import '../../../core/utils/app_colors.dart';
import '../data/login_bloc/login_bloc.dart';
import '../data/login_bloc/login_states.dart';

Container loginButton({required LoginStates state,required LoginBloc cubit,required formKey,required passwordController}) {
  return Container(
    width: double.infinity,
    height: 54,
    child: ConditionalBuilder(
      condition: state is! loginLoadingState,
      builder: (BuildContext context) {
        return DefaultButton(
            buttonLabel: "Login",
            buttonAction: () {
              if (formKey.currentState!.validate()) {
                cubit.login(
                    phone: passwordController.text,
                    password:
                    passwordController.text);
              }
            });
      },
      fallback: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    ),
  );
}