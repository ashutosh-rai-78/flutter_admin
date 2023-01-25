import 'package:flutter/material.dart';
import 'package:flutter_admin/widgets/text_elevated_button.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email".toUpperCase(),
                style: Theme.of(context).textTheme.overline,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                // controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password".toUpperCase(),
                style: Theme.of(context).textTheme.overline,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                // controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: TextElevatedButton(
                      onPressed: () {

                      },
                      child: Text("SignIn",))),
            ],
          ),
        ),
      ),
    );
  }
}
