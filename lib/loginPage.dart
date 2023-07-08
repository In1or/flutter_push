import 'package:flutter/material.dart';
import 'package:flutter_push/registrationPage.dart';

class User {
  final String phoneNumber;
  final String password;

  User({required this.phoneNumber, required this.password});
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _login = true;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: ,
                    children: <TextButton>[
                      TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 174, 42, 39)),
                            overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(0, 0, 0, 0)),
                          ),
                          onPressed: () {

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
                            foregroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(100, 122, 122, 122)),
                            overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(0, 0, 0, 0)),
                          ),
                          onPressed: () {
                            Route route = MaterialPageRoute(builder: (context) => const RegistrationPage());
                            Navigator.push(context, route);
                            // Navigator.pushNamed(context, '/registrationPage');
                          },
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
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                hintText: 'Номер телефона',
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
                                hintText: 'Пароль',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0)
                                )
                            ),
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
                                User user = User(phoneNumber: _nameController.text, password: _passwordController.text);
                              },
                              child: const Text('Войти')
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 196, 196, 196)),
                              overlayColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(0, 0, 0, 0)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Вход по одноразовому паролю',
                              style: TextStyle(
                                  decoration: TextDecoration.underline
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}