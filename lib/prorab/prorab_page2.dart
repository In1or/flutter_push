import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../prorab/prorab_page.dart';

Widget prorabPage2() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        header(),
        objectInfo(),
        objectPhoto(),
        _objectSettingButtuons(),
      ],
    ),
  );
}


Widget objectInfo() {
  return const Padding(
      padding: EdgeInsets.only(top: 20, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Объект',
            style: TextStyle(
                fontFamily: 'PTSerif',
                fontSize: 20,
                color: Color.fromRGBO(174, 42, 39, 1)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Адрес',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 8,
                  color: Color.fromRGBO(122, 122, 122, 1),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                'Йошкар-Ола, бульвар Ураева, дом 4, подъезд 6, этаж 8, квартира 157',
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 10, color: Colors.black),
              )),
          Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Дополнительная информация',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 8,
                  color: Color.fromRGBO(122, 122, 122, 1),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                'Обратить внимание на систему водоснабжения, а так же на корректную работу котла отопления.',
                style: TextStyle(
                    fontFamily: 'Roboto', fontSize: 12, color: Colors.black),
              )),
        ],
      ));
}

Widget objectPhoto() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage('assets/images/object1.png'),
        width: 200,
        height: 250,
      ),
      Image(
        image: AssetImage('assets/images/object2.png'),
        width: 180,
        height: 200,
      )
    ],
  );
}

Widget _objectSettingButtuons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          width: 100,
          height: 25,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(174, 42, 39, 1),
                ),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0))),
            child: const Text(
              'Назад',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 10,
                  color: Color.fromRGBO(174, 42, 39, 1)),
            ),
          )),
      Container(
          width: 100,
          height: 25,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(187, 14, 42, 1.0),
                  Color.fromRGBO(105, 0, 0, 1.0)
                ]),
          ),
          child: const Center(
            child: Text(
              'Взять в работу',
              style: TextStyle(
                  fontFamily: 'Roboto', color: Colors.white, fontSize: 10),
            ),
          ))
    ],
  );
}
