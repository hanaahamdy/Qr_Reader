import 'package:qr_code/features/login/login_model/login_model.dart';

abstract class LoginStates{}
class loginInitState extends LoginStates{}
class loginLoadingState extends LoginStates{}
class loginSuccessState extends LoginStates{

}
class loginErrorState extends LoginStates{
final LoginModel loginModel;

  loginErrorState(this.loginModel);


}