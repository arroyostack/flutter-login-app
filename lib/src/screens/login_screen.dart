import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
              ),
              submitButton(),
            ],
          )),
    );
  }

  // Helpers

  Widget emailField() {
    return TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          } else if (!value.contains('@')) {
            return "Please enter a valid email";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email Address",
          hintText: "yourmail@gmail.com",
        ));
  }

  Widget passwordField() {
    return TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Please enter your password";
          } else if (value.length < 4) {
            return "Password must be at least 4 characters long";
          }
          return null;
        },
        // obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
        ));
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null; // Use the component's default.
          },
        ),
      ),
      onPressed: () {
        formKey.currentState?.validate();
      },
      child: const Text("Login"),
    );
  }
}
