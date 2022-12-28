
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/utils/app_colors.dart';
import 'package:qr_code/core/utils/app_text_style.dart';
import 'package:qr_code/features/login/data/login_bloc/login_bloc.dart';
import 'package:qr_code/features/login/data/login_bloc/login_states.dart';
import 'package:qr_code/features/login/widgets/login_conditional_button.dart';
import 'package:qr_code/features/login/widgets/login_failed_massage.dart';

import '../widgets/build_form_field.dart';
import '../widgets/custom_login_appbar.dart';
import '../widgets/login_successMassege.dart';

class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..loginModel,
      child: BlocConsumer<LoginBloc, LoginStates>(
        listener: (context, state) {
          loginfailedmassege(state);

          loginSuccessMassage(state, context);
        },
        builder: (context, state) {
          LoginBloc cubit = LoginBloc.get(context);
          return Scaffold(
            key: scaffoldKey,
            body: Column(
              children: [
                customLoginAppbar(),
                SizedBox(
                  height: 104,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21, right: 27),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            buildTextFormField(
                                controller: phoneController,
                                label: "Enter Your Phone",
                                keyboardType: TextInputType.phone,
                                validateMassege:
                                    'please enter your phone number'),
                            SizedBox(
                              height: 16,
                            ),
                            buildTextFormField(
                                obseecure: true,
                                controller: passwordController,
                                validateMassege: "please enter your password",
                                label: "Password",
                                suffix: Icons.visibility_off),
                            SizedBox(
                              height: 24,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: AppText(
                                text: "Forgot Password",
                                fontsize: 14,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.darkGrey,
                              ),
                            ),
                            SizedBox(
                              height: 43,
                            ),
                            //
                            // Container(child:ConditionalBuilder(condition: ,) ,)
                            loginButton(state:state, cubit:cubit,formKey:formKey,passwordController:passwordController)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }






}
