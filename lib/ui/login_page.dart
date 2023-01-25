import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/ui/signup_page.dart';
import 'package:flutter_admin/widgets/text_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  TextFormField(
                    // controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
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
                  TextFormField(
                    // controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
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
                          onPressed: () {},
                          child: const Text(
                            "Login",
                          ))),
                  /*-------------------------------- Create Account -------------------------------------------*/

                  SizedBox(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return SignUpPage();
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
