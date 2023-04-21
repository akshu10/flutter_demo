import 'package:flutter/material.dart';

import 'Home.dart';

class Login extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              key: _loginFormKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  if (_loginFormKey.currentState!.validate())
                                    {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Home()))
                                    }
                                },
                            child: const Text('Login'))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
