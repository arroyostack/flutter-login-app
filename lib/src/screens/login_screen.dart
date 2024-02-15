import "package:flutter/material.dart";
import "../mixins/validation_mixin.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
        validator: validateEmail,
        onSaved: (String? value) {
          email = value ?? '';
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email Address",
          hintText: "yourmail@gmail.com",
        ));
  }

  Widget passwordField() {
    return TextFormField(
        validator: validatePassword,
        onSaved: (String? value) {
          password = value ?? '';
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
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          print("Posting ...Email: $email, Password: $password");
        }
      },
      child: const Text("Login"),
    );
  }
}
