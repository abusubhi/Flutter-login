import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task1/screens/login.dart';

class Register_Admin extends StatefulWidget {
  const Register_Admin({super.key});

  @override
  State<Register_Admin> createState() => _Register_Admin();
}

class _Register_Admin extends State<Register_Admin> {
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
              'Admin Register Page',
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
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
                    height: 15,
                  ),
                  TextFormField(
                    //      controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Enter your phone number',
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
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
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'Repeat your Password',
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
                          return Colors.black;
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
                                builder: (context) => LoginScreen()));
                      }
                    },
                    child: Text('Register Now'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
