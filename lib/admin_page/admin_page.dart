import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_push/admin_page/header.dart';
import 'menu.dart';

Map<String, String> objects = {
  'Йошкар-Ола, бульвар Ураева, 4-157': 'Васильев Антон Николаевич',
  'Йошкар-Ола, улица Мира, 68-24': 'Васильев Антон Николаевич',
  'Чебоксары, проспект Победы, 18-95': 'Евсютин Олег Максимович',
  'Йошкар-Ола, улица Машиностроителей, 32-47': 'Леухин Степан Анатольевич'
};

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          header(),
          menu(),
          _searchBar(),
          _objects(objects),
        ],
      ),
    );
  }
}

Widget _searchBar() {
  return Padding(
      padding: const EdgeInsets.only(left: 13, top: 5),
      child: Row(
        children: [
          // dropdown search
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
            padding: const EdgeInsets.only(left: 30),
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
          const Padding(
              padding: EdgeInsets.only(left: 1),
              child: DropdownButtonExample()), // ispolzovat konteiner
        ],
      ));
}

const List<String> filters = <String>['прорабам', 'адресам'];

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
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 10,
      style: const TextStyle(
          color: Colors.black, fontSize: 5, fontFamily: 'Roboto'),
      underline: Container(
        color: Colors.transparent,
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
