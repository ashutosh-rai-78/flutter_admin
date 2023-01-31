import 'package:flutter/material.dart';

import '../../common/widgets/text_elevated_button.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      child: Text("Login",))),
            ],
          ),
        ),
      ),
    );
  }
}
