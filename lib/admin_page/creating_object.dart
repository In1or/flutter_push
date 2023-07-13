import 'package:flutter/material.dart';
import 'header.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: const Color.fromRGBO(174, 42, 39, 1.0),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

class CreatingObject extends StatelessWidget {
  const CreatingObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  header(),
                  const Divider(),
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Объект',
                                  style: TextStyle(
                                      color: Color.fromRGBO(174, 42, 39, 1.0),
                                      fontSize: 15,
                                      fontFamily: 'PT Serif'),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 147),
                                    child: Text(
                                      'Прораб',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0),
                                          fontSize: 15,
                                          fontFamily: 'PT Serif'),
                                    )),
                              ],
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 179,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Город',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                196, 196, 196, 1.0)),
                                        border: OutlineInputBorder(),
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 30,
                                        width: 170,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Имя',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10,
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 1.0)),
                                            border: OutlineInputBorder(),
                                          ),
                                        ))),
                              ],
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 179,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Адрес',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                196, 196, 196, 1.0)),
                                        border: OutlineInputBorder(),
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 30,
                                        width: 170,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Телефон',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10,
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 1.0)),
                                            border: OutlineInputBorder(),
                                          ),
                                        ))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        SizedBox(
                                            height: 30,
                                            width: 35,
                                            child: TextField(
                                              style: TextStyle(fontSize: 4),
                                              decoration: InputDecoration(
                                                labelText: 'Дом',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 5,
                                                    color: Color.fromRGBO(
                                                        196, 196, 196, 1.0)),
                                                border: OutlineInputBorder(),
                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 45,
                                                child: TextField(
                                                  style: TextStyle(fontSize: 4),
                                                  decoration: InputDecoration(
                                                    labelText: 'Подъезд',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 5,
                                                        color: Color.fromRGBO(
                                                            196,
                                                            196,
                                                            196,
                                                            1.0)),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ))),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 37,
                                                child: TextField(
                                                  style: TextStyle(fontSize: 4),
                                                  decoration: InputDecoration(
                                                    labelText: 'Этаж',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 5,
                                                        color: Color.fromRGBO(
                                                            196,
                                                            196,
                                                            196,
                                                            1.0)),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ))),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 47,
                                                child: TextField(
                                                  style: TextStyle(fontSize: 4),
                                                  decoration: InputDecoration(
                                                    labelText: 'Квартира',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 5,
                                                        color: Color.fromRGBO(
                                                            196,
                                                            196,
                                                            196,
                                                            1.0)),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ))),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        SwitchExample(),
                                        Text(
                                          'строящийся объект',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  196, 196, 196, 1.0),
                                              fontSize: 5,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 163,
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0),
                                          Icons.add,
                                          size: 20,
                                        ),
                                        label: const Text(
                                          'Добавить планировку',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  174, 42, 39, 1.0),
                                              fontFamily: 'Roboto',
                                              fontSize: 10),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0),
                                          Icons.add,
                                          size: 20,
                                        ),
                                        label: const Text(
                                          'Добавить фото',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  174, 42, 39, 1.0),
                                              fontFamily: 'Roboto',
                                              fontSize: 10),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 173,
                                      child: ElevatedButton.icon(
                                        icon: const Icon(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0),
                                          Icons.add,
                                          size: 20,
                                        ),
                                        label: const Text(
                                          'Добавить комментарий',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  174, 42, 39, 1.0),
                                              fontFamily: 'Roboto',
                                              fontSize: 10),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 100,
                                        width: 170,
                                        child: TextField(
                                          maxLines: 10,
                                          style: TextStyle(fontSize: 4),
                                          decoration: InputDecoration(
                                            labelText:
                                                'Дополнительная информация',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 5,
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 1.0)),
                                            border: OutlineInputBorder(),
                                          ),
                                        ))),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 20),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                  width: 0.5,
                                  color: Color.fromRGBO(174, 42, 39, 1.0),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Назад',
                              style: TextStyle(
                                  color: Color.fromRGBO(174, 42, 39, 1.0)),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                  width: 0.5,
                                  color: Color.fromRGBO(122, 122, 122, 1.0),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(
                                  color: Color.fromRGBO(122, 122, 122, 1.0),),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                  width: 0.5,
                                  color: Color.fromRGBO(122, 122, 122, 1.0),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Добавить объект',
                              style: TextStyle(
                                  color: Color.fromRGBO(122, 122, 122, 1.0),),
                            )),
                      ])),
                ]),
              )));
    }));
  }
}
