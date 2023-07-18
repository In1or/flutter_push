import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget prorabPage() {
  Map<String, String> objects = {
    'Йошкар-Ола, бульвар Ураева, 4-157': 'Ким Андрей Родионович',
    'Йошкар-Ола, улица Мира, 68-24': 'Матвеев Дамир Рифатович',
    'Чебоксары, проспект Победы, 18-95': 'Минин Дмитрий Максимович',
    'Йошкар-Ола, улица Машиностроителей, 32-47': 'Павлов Игорь Александрович'
  };
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        header(),
        _menu(),
        _searchBar(),
        _objects(objects),
      ],
    ),
  );
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _icon(),
        _user(),
        _logout(),
      ],
    ),
  );
}

Image _icon() {
  return Image.asset(
    'assets/images/logo.png',
    scale: 2,
  );
}

Row _user() {
  return Row(
    children: <Widget>[
      _userImage(),
      Padding(padding: const EdgeInsets.only(left: 8), child: _userInfo()),
    ],
  );
}

Image _userImage() {
  return Image.asset(
    'assets/images/userImage.png',
    scale: 2,
  );
}

Column _userInfo() {
  return Column(
    children: <Widget>[
      _userName(),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _userPost(),
      ),
    ],
  );
}

Text _userName() {
  return const Text(
    'Леухин Степан',
    style: TextStyle(
      fontSize: 12.0,
      fontFamily: "PTSerif",
      color: Color.fromRGBO(174, 42, 39, 1),
    ),
  );
}

Text _userPost() {
  return const Text(
    'прораб',
    style: TextStyle(
      fontSize: 9.0,
      fontFamily: "Roboto",
      color: Color.fromRGBO(122, 122, 122, 1),
    ),
  );
}

ElevatedButton _logout() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      shadowColor: Colors.transparent,
    ),
    child: Row(
      children: <Widget>[
        const Text(
          'Выйти',
          style: TextStyle(
            fontSize: 9.0,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset(
            'assets/images/logout-icon.png',
            scale: 2,
          ),
        ),
      ],
    ),
  );
}

Widget _menu() {
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
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  'Взятые в работу объекты',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 5,
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
                  'Переданные объекты',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 5,
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
                  'Объекты на проверке',
                  style: TextStyle(
                    fontSize: 5,
                    fontFamily: "Roboto",
                    decoration: TextDecoration.underline,
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
                  'Проверенные объекты',
                  style: TextStyle(
                    fontSize: 5,
                    fontFamily: "Roboto",
                  ),
                )),
          ],
        ),
      ));
}

Widget _searchBar() {
  return Padding(
      padding: const EdgeInsets.only(left: 13, top: 15),
      child: Row(
        children: [
          const SizedBox(
            width: 230,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(174, 42, 39, 1.0),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SvgPicture.asset(
              'assets/images/filter-icon.svg',
              width: 20,
              height: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'сортировать по',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 5),
            ),
          ),
          const DropdownButtonExample(),
        ],
      ));
}

const List<String> filters = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = filters.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: filters.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget _objects(Map<String, String> objects) {
  return customObjects(objects);
}

class ListStructure {
  String key;
  String value;

  ListStructure(this.key, this.value);
}

Widget customObjects(Map<String, String> objects) {
  List<ListStructure> list = [];
  objects.forEach((key, value) => list.add(ListStructure(key, value)));

  List<TableRow> rows = [];
  rows.add(TableRow(
      decoration: BoxDecoration(
          border: Border.all(
        width: 0.5,
      )),
      children: [
        Container(
            width: 150,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
              width: 0.5,
            )),
            child: const Padding(
              padding: EdgeInsets.only(left: 5, top: 7),
              child: Text(
                'Адрес',
                style: TextStyle(color: Color.fromRGBO(174, 42, 39, 1.0)),
              ),
            )),
        Container(
            width: 150,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
              width: 0.5,
            )),
            child: const Padding(
              padding: EdgeInsets.only(left: 5, top: 7),
              child: Text(
                'Прораб',
                style: TextStyle(color: Color.fromRGBO(174, 42, 39, 1.0)),
              ),
            )),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
        ),
      ]));

  for (int i = 0; i < 4; i++) {
    rows.add(TableRow(
        decoration: BoxDecoration(
            border: Border.all(
          width: 0.5,
        )),
        children: [
          Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 0.5,
              )),
              child: Center(
                child: Text(
                  list[i].key,
                  style: const TextStyle(color: Colors.black, fontSize: 6),
                ),
              )),
          Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 0.5,
              )),
              child: Center(
                child: Text(
                  list[i].value,
                  style: const TextStyle(color: Colors.black, fontSize: 8),
                ),
              )),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: const Icon(Icons.edit),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            child: const Icon(Icons.delete),
          ),
        ]));
  }
  return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Table(columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: IntrinsicColumnWidth(),
      }, children: rows));
}
