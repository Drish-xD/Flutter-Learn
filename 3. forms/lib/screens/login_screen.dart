import 'package:flutter/material.dart';
import 'package:forms/mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidatorMixin {
  bool saved = false;
  final formKey = GlobalKey<FormState>();
  String? email = "";
  String? pass = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailField(),
            passwordField(),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() => saved = true);
                  }
                },
                child: const Text("Login")),
            const SizedBox(height: 10),
            if (saved) Text("logged In Successfully with $email")
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("Email Address"),
        hintText: "you@example.com",
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text("Password"),
        hintText: "Password",
      ),
      validator: validatePass,
      onSaved: (value) {
        pass = value;
      },
      obscureText: true,
    );
  }
}
