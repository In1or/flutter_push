import 'package:flutter/material.dart';
import '../header/header.dart';
import '../searchbar/searchbar.dart';
import 'building_object_class.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'creating_object/creating_object.dart';
import 'editing_object/editing_object.dart';

// todo:
// make searchbar
//   add foreman
//   sorting
// make validation

int currentTab = 1;
const int activeObjectsTab = 1;
const int savedObjectsTab = 2;
const int finishedObjectsTab = 3;

List<String> _allForeMen = [
  'Васильев Антон Николаевич',
  'Евсютин Олег Максимович',
  'Евсютин Константин Германович',
  'Леухин Степан Анатольевич',
  'Add',
];

Set<BuildingObject> activeObjects = {},
    savedObjects = {},
    finishedObjects = {},
    renderedObjects = activeObjects;

class AdminPageWidget extends StatefulWidget {
  const AdminPageWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AdminPageWidgetState();
}

class _AdminPageWidgetState extends State<AdminPageWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          header(),
          const AdminPageComponentsWidget(),
        ],
      ),
    );
  }
}

class AdminPageComponentsWidget extends StatefulWidget {
  const AdminPageComponentsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AdminPageComponentsWidgetState();
}

class _AdminPageComponentsWidgetState extends State<AdminPageComponentsWidget> {
  void _chooseTab(int tab) {
    setState(() {
      switch (tab) {
        case 1:
          currentTab = 1;
          renderedObjects = activeObjects;
          break;
        case 2:
          currentTab = 2;
          renderedObjects = savedObjects;
          break;
        case 3:
          currentTab = 3;
          renderedObjects = finishedObjects;
          break;
      }
    });
  }

  void _addObject(Map<String, BuildingObject> result) {
    setState(() {
      switch (result.keys.toList()[0]) {
        case 'A':
          activeObjects.add(result.values.toList()[0]);
          break;
        case 'S':
          savedObjects.add(result.values.toList()[0]);
          break;
        case 'F':
          finishedObjects.add(result.values.toList()[0]);
          break;
      }
    });
  }

  void _addForemen() {}

  Future<String?> _showDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const SizedBox(
            width: 300,
            height: 70,
            child: Column(
              children: [
                SizedBox(
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Имя',
                        border: OutlineInputBorder(),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Телефон',
                            border: OutlineInputBorder(),
                          ),
                        ))),
              ],
            )),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Container(
                      width: 265,
                      height: 30,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(187, 14, 42, 1.0),
                              Color.fromRGBO(105, 0, 0, 1.0)
                            ]),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shadowColor: Colors.transparent),
                        onPressed: () {
                          _addForemen();
                        },
                        child: const Center(
                            child: Text(
                          'Добавить',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )),
                      )))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
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
                Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        label: const Text(
                          'Добавить объект',
                          style: TextStyle(fontSize: 5, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            side: const BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            )),
                        onPressed: () async {
                          Map<String, BuildingObject> result =
                              await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreatingObjectWidget(),
                            ),
                          );
                          _addObject(result);
                        })),
                ElevatedButton(
                    onPressed: () => _chooseTab(activeObjectsTab),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text('Переданные объекты',
                        style: ((currentTab == activeObjectsTab)
                            ? const TextStyle(
                                fontSize: 5,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -5)),
                                ],
                                color: Colors.transparent,
                                decorationColor: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationThickness: 4,
                              )
                            : const TextStyle(
                                fontSize: 5,
                              )))),
                ElevatedButton(
                    onPressed: () => _chooseTab(savedObjectsTab),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Сохраненные объекты',
                      style: ((currentTab == savedObjectsTab)
                          ? const TextStyle(
                              fontSize: 5,
                              shadows: [
                                Shadow(
                                    color: Colors.white, offset: Offset(0, -5)),
                              ],
                              color: Colors.transparent,
                              decorationColor: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationThickness: 4,
                            )
                          : const TextStyle(
                              fontSize: 5,
                            )),
                    )),
                ElevatedButton(
                    onPressed: () => _chooseTab(finishedObjectsTab),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Завершенные объекты',
                      style: ((currentTab == finishedObjectsTab)
                          ? const TextStyle(
                              fontSize: 5,
                              shadows: [
                                Shadow(
                                    color: Colors.white, offset: Offset(0, -5)),
                              ],
                              color: Colors.transparent,
                              decorationColor: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationThickness: 4,
                            )
                          : const TextStyle(
                              fontSize: 5,
                            )),
                    )),
              ],
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(left: 13, top: 5),
          child: Row(
            children: [
              Container(
                  width: 230,
                  height: 30,
                  child: SearchField(
                    suggestionItemDecoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                    searchInputDecoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(174, 42, 39, 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        )),
                    suggestions: _allForeMen
                        .map((e) => SearchFieldListItem(e,
                            child: (e != 'Add')
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(e))
                                : ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Color.fromRGBO(174, 42, 39, 1.0),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      _showDialog();
                                    },
                                    label: const Text(
                                      'добавить прораба',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0)),
                                    ))))
                        .toList(),
                  )),
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
                  child: DropdownButtonExample()),
            ],
          )),
      ObjectsWidget(),
    ]);
  }
}

class ObjectsWidget extends StatefulWidget {
  const ObjectsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ObjectsWidget();
}

class _ObjectsWidget extends State<ObjectsWidget> {
  void _editObject(Map<String, BuildingObject> result, int index) {
    setState(() {
      if (result.keys.toList()[0] == 'SE') {
        return;
      }
      switch (currentTab) {
        case activeObjectsTab:
          activeObjects.remove(activeObjects.elementAt(index));
          break;
        case savedObjectsTab:
          savedObjects.remove(savedObjects.elementAt(index));
          break;
        case finishedObjectsTab:
          finishedObjects.remove(finishedObjects.elementAt(index));
          break;
      }
      switch (result.keys.toList()[0]) {
        case 'A':
          activeObjects.add(result.values.toList()[0]);
          break;
        case 'S':
          savedObjects.add(result.values.toList()[0]);
          break;
        case 'F':
          finishedObjects.add(result.values.toList()[0]);
          break;
      }
    });
  }

  void deleteObject(BuildingObject object) {
    setState(() {
      switch (currentTab) {
        case activeObjectsTab:
          activeObjects.remove(object);
          break;
        case savedObjectsTab:
          savedObjects.remove(object);
          break;
        case finishedObjectsTab:
          finishedObjects.remove(object);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int renderedObjectsLength = renderedObjects.length;

    List<String> addresses = [];
    List<String> names = [];

    for (var element in renderedObjects) {
      String address =
          '${element.city}, ${element.address}, ${element.house} - ${element.apartment}';
      String name = element.foreManName;
      addresses.add(address);
      names.add(name);
    }

    List<TableRow> rows = [];
    if (renderedObjects.isEmpty) {
      return const SizedBox.shrink();
    }
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

    for (int i = 0; i < renderedObjectsLength; i++) {
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
                    addresses[i],
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
                    names[i],
                    style: const TextStyle(color: Colors.black, fontSize: 8),
                  ),
                )),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  iconSize: 15,
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    Map<String, BuildingObject> result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditingObjectWidget(
                            editingObject: renderedObjects.elementAt(i)),
                      ),
                    );
                    _editObject(result, i);
                  }),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                iconSize: 15,
                icon: const Icon(Icons.delete),
                onPressed: () => deleteObject(renderedObjects.elementAt(i)),
              ),
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
}
