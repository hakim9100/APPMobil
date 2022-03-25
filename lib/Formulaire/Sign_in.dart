import 'package:flutter/material.dart';
import 'package:flutter_application_4/Formulaire/authentication.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isSecret = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Hello Everyone',
                style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80.0,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                obscureText: _isSecret,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => setState(() => _isSecret = !_isSecret),
                    child: Icon(
                        !_isSecret ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  context.read<Authentication>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setState(bool Function() param0) {}
}
