import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
          child: Column(
        children: [
          // emailField(),
          // passwordField(),
          // submitButton(),
        ],
      )),
    );
  }

  // Helpers

  // Widget emailField() {}

  // Widget passwordField() {}

  // Widget submitButton() {}
}
