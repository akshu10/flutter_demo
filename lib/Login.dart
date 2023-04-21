import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'model/User.dart';

var client = http.Client();

Future<void> login(email, password) async {
  print('Email: ${email}');
  print('Password: ${password}');

  try {
    var url = Uri.https('rafflebox-test.ca', 'auth/token');
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'email': email,
      'password': password
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } catch (error) {
    print(error);
  }

  // if (response.statusCode == 200) {
  //   // If the server did return a 200 OK response,
  //   // then parse the JSON.
  //   return User.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

class Login extends StatelessWidget {
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

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
                      controller: emailController,
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
                      controller: passwordController,
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
                            onPressed: () async => {
                                  await login(emailController.text,
                                      passwordController.text),

                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Home()))
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
