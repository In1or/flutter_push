import 'package:flutter/material.dart';
import 'package:flutter_push/prorab/prorab_page3.dart';
import '../prorab/prorab_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../prorab/prorab_page2.dart';
import '../prorab/prorab_page4.dart';

Widget addObject2() {
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

Widget _objectButtons()
{
  return Column(
      children: [
        objectButtonRed('assets/images/parquet.svg', 'Пол'),
        objectButtonWhite('assets/images/brick-wall.svg', 'Стены'),
        objectButtonWhite('assets/images/ceiling.svg', 'Потолок'),
        objectButtonWhite('assets/images/windows.svg', 'Окна'),
        objectButtonWhite('assets/images/power-plug.svg', 'Электричество'),
        objectButtonWhite('assets/images/pipe.svg', 'Инженерные коммуникации'),
      ],
  );
}