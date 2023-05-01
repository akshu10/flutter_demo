import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Home.dart';
import 'model/app_state.dart';
import 'model/auth_response.dart';

var client = http.Client();

Future<String> login(email, password) async {
  try {
    var url = Uri.https('api.rafflebox-test.ca', 'auth/token');
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'email': email,
      'password': password
    });

    var responseToJson = jsonDecode(response.body);

    if (response.statusCode == 201) {
      var token = responseToJson['data']['token'];
      var user = responseToJson['data']['data'];

      var authResponse = AuthResponse.fromJson({
        "token": token,
        "user": user,
      });

      print('Auth Response Object: ${authResponse.token}');
      print('Auth Response Object: ${authResponse.user}');

      return responseToJson.token;
    }
  } catch (error) {
    print(error);
  } finally {
    return '';
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
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic response;
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
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Enter your password'),
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
                                  Provider.of<AppState>(context, listen: false)
                                      .setUser({
                                    "email": emailController.text,
                                    'password': passwordController.text
                                  }),
                                  response = await login(emailController.text,
                                      passwordController.text),

                                  // ignore: avoid_print
                                  print('Response: $response'),
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Home()))
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
