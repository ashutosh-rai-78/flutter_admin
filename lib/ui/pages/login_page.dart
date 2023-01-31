import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/common/utils.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/network/base/network_call.dart';

import '../../common/widgets/auth_text_field.dart';
import '../../common/widgets/text_elevated_button.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: emailController,
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
                    controller: passwordController,
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
                            debugPrint(
                                "onPressed Called" + emailController.text);
                            Utils.toastMessage("onPressed Called");

                            NetworkCall().NetworkResponse(emailController.text,
                                passwordController.text) /**/;
                          },
                          child: const Text(
                            "Login",
                          ))),
                  /*-------------------------------- Create Account -------------------------------------------*/

                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            ?.copyWith(fontSize: 14),
                        // defining default style is optional
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SignUpPage();
                                  }));
                                },
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
