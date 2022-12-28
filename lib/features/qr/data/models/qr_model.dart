class QrModel {
  String massege;
  List<Data>?data;

  QrModel({required this.data, required this.massege});

  factory QrModel.fromJson(dynamic json){
    List<Data> DataItems=[];
    json["data"].forEach((elemnt){DataItems.add(Data.fromJson(elemnt));});
    return QrModel(data:DataItems, massege: json["massage"]);
  }
}

class Data {
  int id;
  String code;


  Data(
      {required this.id, required this.code,});

  factory Data.fromJson(dynamic json){
    return Data(id: json["id"],
        code: json["code"],
       );
  }
}