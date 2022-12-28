import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/network/api_helper.dart';
import 'package:qr_code/features/qr/data/bloc/Qr_statets.dart';
import 'package:qr_code/features/qr/data/models/qr_model.dart';

class QrBloc extends Cubit<QrStates> {
  QrBloc() : super(QrInitStates());

  static QrBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  String qr_result = "";

  Future scan() async {
    emit(QrLoadingtates());
    await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR)
        .then((value) {
          qr_result=value.hashCode.toString();
      emit(QrSuccesstates());
      print("result=" + value.hashCode.toString());
    }).catchError(
      (onError) {
        emit(QrErrorStates());
        print(onError.toString());
      },
    );
  }
  
  void postScanCodes(){
    emit(PostCodeLoadingtates());
    ApiHelper.postData(url: "scan", data: {"code":qr_result}).then((value)  {
      print(value);
      emit(PostCodeSuccesstates());
    }).catchError((onError){
      emit(PostCodeErrorStates());
    });
  }
  

  
  
QrModel?qrModel;
  void getQrCodes() async {
    emit(GetQrLoadingtates());
    await ApiHelper.getData(
            url: "my-codes",)
        .then((value) {
     qrModel=QrModel.fromJson(value.data);
     print(qrModel?.data?[0].code);
      emit(GetQrSuccesstates());
    }).catchError((onError) {
      emit(GetQrErrorStates());
      print(onError.toString());
    });
  }
}
