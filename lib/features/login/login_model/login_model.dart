class LoginModel{
  int? status;
  String? massage;
  LoginModel({required this.massage,required this.status});
  factory LoginModel.fromJson(Map<String,dynamic>json){
    return LoginModel(massage: json["massege"], status: json["status"]);
  }
}