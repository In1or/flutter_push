import 'package:flutter/material.dart';
import 'dart:async';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    // 3 секунды загрузочный экран
    Future.delayed(Duration(seconds: 3), () {
      // После завершения загрузки переходите на другой экран.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/loading-screen.png'),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Нужно доверстать',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
