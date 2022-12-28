import 'package:flutter/material.dart';
import 'package:qr_code/core/utils/app_colors.dart';

TextFormField buildTextFormField(
    {bool? obseecure,required String label,required TextEditingController controller,IconData? suffix, TextInputType? keyboardType,required String? validateMassege}) {
  return TextFormField(obscureText:obseecure==null?false:obseecure ,
    controller: controller,
    validator: (value){
      if(value!.isEmpty){
        return validateMassege;
      }
    },
    cursorColor: AppColors.darkGrey,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        suffixIcon: suffix == null
            ? null
            : Icon(
                suffix,
                color: AppColors.darkGrey,
              ),
        label: Text(
          label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(color: AppColors.lightGrey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1),
            borderSide: BorderSide(color: AppColors.lightGrey))),
  );
}
