import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task1/screens/home.dart';
import 'package:task1/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController textFieldController;
  final _formkey = GlobalKey<FormState>();
// crear this befor anything
  @override
  void initState() {
    super.initState();
    textFieldController = TextEditingController();
  }

//عدم اخذ مساحة في الميموري
  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text(
              'Admin Login',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    //     controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter your E-mail',
                    ),
                    onChanged: (value) {
                      log(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this is empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 47, 46, 36)),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter your Password',
                    ),
                    onChanged: (value) {
                      log(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this is empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused))
                          return Colors.red;
                        return null; // Defer to the widget's default.
                      }),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Done')));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminHome()));
                      }
                    },
                    child: Text('Login'),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused))
                            return Colors.red;
                          return null; // Defer to the widget's default.
                        }),
                      ),
                      child: Text('Register'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register_Admin()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
