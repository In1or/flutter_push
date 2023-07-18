import 'package:flutter/material.dart';
import '../prorab/prorab_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../prorab/prorab_page2.dart';

Widget addObject() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        header(),
        objectInfo(),
        objectPhoto(),
        _objectButtons(),
        objectSettingButtuons(),
      ],
    ),
  );
}

Widget objectButtonRed(String image, String textButton)
{
  return Container(
    width: 370,
    height: 30,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(187, 14, 42, 1.0),
          Color.fromRGBO(105, 0, 0, 1.0)
        ],
      ),
    ),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10),  child: SvgPicture.asset(
              '$image',
              height: 25,
              color: Colors.white, // Устанавливаем белый цвет для иконки
            ),
            ),
            SizedBox(width: 8), // Добавляем отступ между иконкой и текстом
            Text(
              '$textButton',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget objectButtonWhite(String image, String textButton)
{
  return Container(
    width: 370,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0.5),
    ),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          primary: Colors.transparent,
          elevation: 0,
        ),
        child: Row(
          children: [
        Padding(padding: EdgeInsets.only(left: 10), child:SvgPicture.asset(
              '$image',
              height: 25,
              color: Colors.black, // Устанавливаем белый цвет для иконки
            ),),
            SizedBox(width: 8), // Добавляем отступ между иконкой и текстом
            Text(
              '$textButton',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget _objectButtons() {
  return Column(
    children: [
      objectButtonRed('assets/images/bedroom.svg', 'Жилая комната 1'),
      objectButtonWhite('assets/images/bedroom.svg', 'Жилая комната 2'),
      objectButtonWhite('assets/images/bedroom.svg', 'Жилая комната 3'),
      objectButtonWhite('assets/images/kitchen.svg', 'Кухня'),
      objectButtonWhite('assets/images/hangers.svg', 'Коридор'),
      objectButtonWhite('assets/images/toilet.svg', 'Туалет'),
      objectButtonWhite('assets/images/bathtub.svg', 'Ванная'),
      objectButtonWhite('assets/images/balcony.svg', 'Лоджия/балкон'),
      objectButtonWhite('assets/images/shelf-book.svg', 'Кладовая'),
      objectButtonWhite('assets/images/parking.svg', 'Парковочное место'),
      objectButtonWhite('assets/images/bathroom.svg', 'Совмещенный санузел'),
      objectButtonWhite('assets/images/staircase.svg', 'Лестница'),
      objectButtonWhite('assets/images/garage.svg', 'Гараж'),
      objectButtonWhite('assets/images/joist.svg', 'Чердак'),
      objectButtonWhite('assets/images/basement.svg', 'Подвал'),
      objectButtonWhite('assets/images/non-residential-premises.svg', 'Нежилое помещение'),
      objectButtonWhite('assets/images/boiler.svg', 'Бойлерная'),
    ],
  );
}

Widget objectSettingButtuons() {
  return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Row(
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
                  'Сохранить',
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
                  'Готово',
                  style: TextStyle(
                      fontFamily: 'Roboto', color: Colors.white, fontSize: 10),
                ),
              ))
        ],
      ));
}
