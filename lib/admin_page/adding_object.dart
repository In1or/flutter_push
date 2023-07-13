import 'package:flutter/material.dart';
import 'creating_object.dart';

class AddingObject extends StatelessWidget {
  const AddingObject({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
        onPressed: () {
          Route route = MaterialPageRoute(
              builder: (context) => const CreatingObject());
          Navigator.push(context, route);
        }
    );
  }
}

/* showDialog<String>(
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
                            Route route = MaterialPageRoute(builder: (context) => const CreatingObject());
                            Navigator.push(context, route);
                          },
                          child: const Center(
                              child: Text(
                            'Добавить',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                        )))),
          ],
        ),*/
