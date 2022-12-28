import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/network/api_helper.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/bloc_observer.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_cubit.dart';
import 'package:qr_code/features/qr/views/qr_fetch_screen.dart';
import 'package:qr_code/features/qr/views/qr_result_code.dart';

import 'features/login/views/login_screen.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>QrBloc()..getQrCodes(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor
        ),
        home: Login()
      ),
    );
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}