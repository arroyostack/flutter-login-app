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
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email Address",
          hintText: "yourmail@gmail.com",
        ));
  }

  Widget passwordField() {
    return TextFormField(
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
      onPressed: () {},
      child: const Text("Login"),
    );
  }
}
