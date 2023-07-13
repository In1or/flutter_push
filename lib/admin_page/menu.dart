import 'package:flutter/material.dart';

import 'adding_object.dart';

Widget menu() {
  return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 30,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(187, 14, 42, 1.0),
              Color.fromRGBO(105, 0, 0, 1.0),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(left: 8),
                child: AddingObject()),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Переданные объекты',
                  style: TextStyle(
                    fontSize: 5,
                    shadows: [
                      Shadow(color: Colors.white, offset: Offset(0, -5)),
                    ],
                    color: Colors.transparent,
                    decorationColor: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationThickness: 4,
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Сохраненные объекты',
                  style: TextStyle(fontSize: 5),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Завершенные объекты',
                  style: TextStyle(fontSize: 5),
                )),
          ],
        ),
      ));
}