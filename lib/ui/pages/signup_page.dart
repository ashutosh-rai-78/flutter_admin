import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/common/widgets/text_elevated_button.dart';
import 'package:flutter_admin/ui/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*-------------------------------- Name -------------------------------------------*/

                  Text(
                    "Name".toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /*-------------------------------- Email -------------------------------------------*/
                  Text(
                    "Email".toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: emailController,
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
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /*-------------------------------- Confirm Password -------------------------------------------*/
                  Text(
                    "Confirm Password".toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  /*-------------------------------- Login Button -------------------------------------------*/

                  Center(
                      child: TextElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign up",
                          ))),
                  /*-------------------------------- Create Account -------------------------------------------*/

                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            ?.copyWith(fontSize: 14),
                        // defining default style is optional
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginPage();
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
  }
}
