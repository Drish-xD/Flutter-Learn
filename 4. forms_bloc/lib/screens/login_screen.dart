import 'package:flutter/material.dart';
import 'package:forms_bloc/blocs/bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailField(),
          passwordField(),
          const SizedBox(height: 10),
          submitButton(),
          const SizedBox(height: 10),
          isLogin == true ? const Text("User is LoggedIn") : const Text(""),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "you@example.com",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          onChanged: bloc.changePassword,
          obscureText: true,
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData
              ? () {
                  bloc.submit();
                  setState(() {
                    isLogin = true;
                  });
                }
              : null,
          child: const Text("Login"),
        );
      },
    );
  }
}
