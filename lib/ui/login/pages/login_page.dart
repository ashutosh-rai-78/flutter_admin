import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/common/utils.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/network/base/network_call.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/ui/login/view_models/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_x/view_model_x.dart';

import '../../../common/common.dart';
import '../../../common/widgets/auth_text_field.dart';
import '../../../common/widgets/text_elevated_button.dart';

class LoginPage extends StatelessWidget with RouteWrapper {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget wrappedRoute(BuildContext context) => ViewModelProvider(
      create: (BuildContext context) => LoginViewModel(locator()), child: this);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.vm<LoginViewModel>();
    return SharedFlowListener(
      listener: (BuildContext context, value) { 
        if(value == "ok"){
          GoRouter.of(context).pushReplacementNamed(Routes.home.name);
        }else{
          Utils.toastMessage(value);
        }
       },
      sharedFlow: viewModel.sharedFlow,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*-------------------------------- Email -------------------------------------------*/
                    Text(
                      "Email".toUpperCase(),
                      style: Theme.of(context).textTheme.overline,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthTextField(
                      controller: viewModel.emailController,
                      hint: 'Email',
                      type: AuthTextFieldType.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*-------------------------------- Password -------------------------------------------*/
                    Text(
                      "Password".toUpperCase(),
                      style: Theme.of(context).textTheme.overline,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AuthTextField(
                      controller: viewModel.passwordController,
                      hint: 'Password',
                      type: AuthTextFieldType.password,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    /*-------------------------------- Forget Button -------------------------------------------*/
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    /*-------------------------------- Login Button -------------------------------------------*/
    
                    Center(
                        child: TextElevatedButton(
                            onPressed: () {
                              viewModel.login();
                             
                            },
                            child: const Text(
                              "Login",
                            ))),
                    /*-------------------------------- Create Account -------------------------------------------*/
    
                    const SizedBox(
                      height: 15,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
