import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/network/api_helper.dart';
import 'package:qr_code/features/login/login_model/login_model.dart';
import 'login_states.dart';

class LoginBloc extends Cubit<LoginStates>{
  LoginBloc():super(loginInitState());
  static LoginBloc get(BuildContext context){
    return BlocProvider.of(context);

  }
  LoginModel?loginModel;
  void login({required String phone,required String password}){
    emit(loginLoadingState());
    ApiHelper.postData(url: "login-scanner",data: {
      "phone":phone,
      "password":password
    }).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      emit(loginSuccessState());
    }).catchError((onError){
      emit(loginErrorState(loginModel!));
    });
  }

}