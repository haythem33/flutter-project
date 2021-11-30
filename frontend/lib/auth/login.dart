import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/auth/register.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: const MyLoginState());
  }
}

class MyLoginState extends StatefulWidget {
  const MyLoginState({Key? key}) : super(key: key);
  @override
  State<MyLoginState> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLoginState> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (!value.isEmail()) {
                return 'Please enter valid email';
              }
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter Password'),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              setState(() {
                password = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final response = await login();
                switch (response.statusCode) {
                  case 202:
                    showDialog(
                        context: context,
                        builder: (context) => showMydialog("LOGIN SUCCESS"));
                    break;
                  case 500:
                    showDialog(
                        context: context,
                        builder: (context) =>
                            showMydialog("LOGIN FAILED INTERNAL ERROR"));
                    break;
                  case 401:
                    showDialog(
                        context: context,
                        builder: (context) => showMydialog("BAD INFORMATION"));
                    break;
                }
              }
            },
          )
        ],
      ),
    );
  }

  Future<http.Response> login() {
    return http.post(Uri.parse('http://localhost:3000/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String?>{'email': email, 'password': password}));
  }

  Widget showMydialog(String message) {
    return AlertDialog(
        title: const Text("MESSAGE"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text("Message :" + message)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ]);
  }
}
