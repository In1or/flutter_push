import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_push/main.dart';

class CheckboxAgree extends StatefulWidget {
  const CheckboxAgree({super.key});

  @override
  State<CheckboxAgree> createState() => _CheckboxAgreeState();
}

class _CheckboxAgreeState extends State<CheckboxAgree> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Color.fromARGB(100, 122, 122, 122);
    }

    return SizedBox(
      height: 25,
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}

class User {
  final String name;
  final String secondName;
  final String jobTitle;
  final String password;

  User({required this.name, required this.secondName, required this.jobTitle, required this.password});
}


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _secondNameController.dispose();
    _jobTitleController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <TextButton>[
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(100, 122, 122, 122)),
                              overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(0, 0, 0, 0)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Вход',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            )
                        ),
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 174, 42, 39)),
                              overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(0, 0, 0, 0)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Регистрация',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            )
                        ),
                      ]
                  ),

                  Form(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                      ),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                  hintText: 'Имя',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              controller: _secondNameController,
                              decoration: const InputDecoration(
                                  hintText: 'Фамилия',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              controller: _jobTitleController,
                              decoration: const InputDecoration(
                                  hintText: 'Должность',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  hintText: 'Придумайте пароль',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: TextFormField(
                              controller: _repeatPasswordController,
                              decoration: const InputDecoration(
                                  hintText: 'Повторите пароль',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0)
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SizedBox(
                            child: Row(
                              children: [
                                CheckboxAgree(),
                                Flexible(
                                  child: Text(
                                    'Я ознакомился с правилами и политикой конфиденциальности',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(100, 122, 122, 122),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 191, 15, 44)),
                              ),
                              onPressed: () {
                                User user = User(name: _nameController.text, secondName: _secondNameController.text,
                                jobTitle: _jobTitleController.text, password: _passwordController.text);
                              },
                              child: const Text('Зарегистрироваться')
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}