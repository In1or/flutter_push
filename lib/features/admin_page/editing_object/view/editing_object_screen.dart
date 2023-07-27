import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../header/header.dart';
import '../../building_object_class.dart';

class EditingObjectWidget extends StatefulWidget {
  const EditingObjectWidget({super.key, required this.editingObject});
  final BuildingObject editingObject;

  @override
  State<EditingObjectWidget> createState() => _EditingObjectWidgetState();
}

class _EditingObjectWidgetState extends State<EditingObjectWidget> {
  XFile? layoutImage;
  List<XFile>? pictures = [];

  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _houseController = TextEditingController();
  final _entranceController = TextEditingController();
  final _floorController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _foreManNameController = TextEditingController();
  final _foreManNumberController = TextEditingController();
  final _infoController = TextEditingController();

  String _city = '';
  String _address = '';
  String _house = '';
  String _apartment = '';
  String _foreManName = '';
  bool _isFinished = false;

  final ImagePicker picker = ImagePicker();

  Future getLayoutImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      layoutImage = img;
    });
  }

  Future getPicture(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      pictures!.add(img!);
    });
  }

  _changeCity() {
    setState(() => _city = _cityController.text);
  }

  _changeAddress() {
    setState(() => _address = _addressController.text);
  }

  _changeHouse() {
    setState(() => _house = _houseController.text);
  }

  _changeApartment() {
    setState(() => _apartment = _apartmentController.text);
  }

  _changeForeManName() {
    setState(() => _foreManName = _foreManNameController.text);
  }

  Map<String, BuildingObject> _skipObject() {
    BuildingObject object = BuildingObject(
        _city,
        _address,
        _house,
        _apartment,
        _foreManName,
        _isFinished,
        _entranceController.text,
        _floorController.text,
        _foreManNumberController.text,
        _infoController.text,
        layoutImage);
    Map<String, BuildingObject> returnedObject = {'SE': object};
    return returnedObject;
  }

  Map<String, BuildingObject> _addObject() {
    BuildingObject object = BuildingObject(
        _city,
        _address,
        _house,
        _apartment,
        _foreManName,
        _isFinished,
        _entranceController.text,
        _floorController.text,
        _foreManNumberController.text,
        _infoController.text,
        layoutImage,
        pictures);
    Map<String, BuildingObject> returnedObject = {};
    if (!_isFinished) {
      returnedObject = {'F': object};
    } else {
      returnedObject = {'A': object};
    }
    return returnedObject;
  }

  Map<String, BuildingObject> _saveObject() {
    BuildingObject object = BuildingObject(
        _city,
        _address,
        _house,
        _apartment,
        _foreManName,
        _isFinished,
        _entranceController.text,
        _floorController.text,
        _foreManNumberController.text,
        _infoController.text,
        layoutImage,
        pictures);
    Map<String, BuildingObject> returnedObject = {'S': object};
    return returnedObject;
  }

  @override
  void initState() {
    super.initState();
    _cityController.text = _city = widget.editingObject.city;
    _addressController.text = _address = widget.editingObject.address;
    _houseController.text = _house = widget.editingObject.house;
    _apartmentController.text = _apartment = widget.editingObject.apartment;
    _foreManNameController.text =
        _foreManName = widget.editingObject.foreManName;
    _entranceController.text = widget.editingObject.entrance!;
    _floorController.text = widget.editingObject.floor!;
    _foreManNumberController.text = widget.editingObject.foreManNumber!;
    _infoController.text = widget.editingObject.info!;
    _isFinished = widget.editingObject.isFinished;
    layoutImage = widget.editingObject.planningPicture;
    pictures = widget.editingObject.pictures;
    _cityController.addListener(_changeCity);
    _addressController.addListener(_changeAddress);
    _houseController.addListener(_changeHouse);
    _apartmentController.addListener(_changeApartment);
    _foreManNameController.addListener(_changeForeManName);
  }

  @override
  void dispose() {
    _cityController.dispose();
    _addressController.dispose();
    _houseController.dispose();
    _entranceController.dispose();
    _floorController.dispose();
    _apartmentController.dispose();
    _foreManNameController.dispose();
    _foreManNumberController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  void _deleteLayoutPicture() {
    setState(() {
      layoutImage = null;
    });
  }

  void _deletePicture(int i) {
    setState(() {
      pictures!.removeAt(i);
    });
  }

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
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 179,
                                    child: TextField(
                                      controller: _cityController,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                      decoration: const InputDecoration(
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
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 30,
                                        width: 170,
                                        child: TextField(
                                          controller: _foreManNameController,
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                          decoration: const InputDecoration(
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
                        Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 179,
                                    child: TextField(
                                      controller: _addressController,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                      decoration: const InputDecoration(
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
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 30,
                                        width: 170,
                                        child: TextField(
                                          controller: _foreManNumberController,
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                          decoration: const InputDecoration(
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
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 30,
                                            width: 35,
                                            child: TextField(
                                              controller: _houseController,
                                              style:
                                                  const TextStyle(fontSize: 10),
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                labelText: 'Дом',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 8,
                                                    color: Color.fromRGBO(
                                                        196, 196, 196, 1.0)),
                                                border: OutlineInputBorder(),
                                              ),
                                            )),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 45,
                                                child: TextField(
                                                  controller:
                                                      _entranceController,
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    labelText: 'Подъезд',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 37,
                                                child: TextField(
                                                  controller: _floorController,
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    labelText: 'Этаж',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                                height: 30,
                                                width: 47,
                                                child: TextField(
                                                  controller:
                                                      _apartmentController,
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    labelText: 'Квартира',
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
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
                                    Row(
                                      children: [
                                        Switch(
                                          value: _isFinished,
                                          activeColor: const Color.fromRGBO(
                                              174, 42, 39, 1.0),
                                          onChanged: (bool value) {
                                            setState(() {
                                              _isFinished = value;
                                            });
                                          },
                                        ),
                                        const Text(
                                          'строящийся объект',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  196, 196, 196, 1.0),
                                              fontSize: 10,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ],
                                    ),
                                    layoutImage != null
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.file(
                                                      File(layoutImage!.path),
                                                      width: 169,
                                                      height: 128,
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 98),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          _deleteLayoutPicture();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          elevation: 0.0,
                                                          shadowColor: Colors
                                                              .transparent,
                                                        ),
                                                        child: const Text(
                                                          'удалить',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    174,
                                                                    42,
                                                                    39,
                                                                    1.0),
                                                            fontSize: 10,
                                                          ),
                                                        ))),
                                              ],
                                            ))
                                        : SizedBox(
                                            width: 163,
                                            child: ElevatedButton.icon(
                                              icon: const Icon(
                                                color: Color.fromRGBO(
                                                    174, 42, 39, 1.0),
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
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0.0,
                                                shadowColor: Colors.transparent,
                                              ),
                                              onPressed: () {
                                                getLayoutImage(
                                                    ImageSource.gallery);
                                              },
                                            ),
                                          ),
                                    pictures!.isNotEmpty
                                        ? Column(
                                            children: [
                                              for (int i = 0;
                                                  i < pictures!.length;
                                                  i++)
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.file(
                                                              File(pictures![i]
                                                                  .path),
                                                              width: 169,
                                                              height: 128,
                                                            )),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 98),
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      _deletePicture(
                                                                          i);
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      elevation:
                                                                          0.0,
                                                                      shadowColor:
                                                                          Colors
                                                                              .transparent,
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      'удалить',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            174,
                                                                            42,
                                                                            39,
                                                                            1.0),
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ))),
                                                      ],
                                                    )),
                                              if (pictures!.length != 10)
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 49),
                                                    child: SizedBox(
                                                      width: 130,
                                                      child:
                                                          ElevatedButton.icon(
                                                        icon: const Icon(
                                                          color: Color.fromRGBO(
                                                              174, 42, 39, 1.0),
                                                          Icons.add,
                                                          size: 20,
                                                        ),
                                                        label: const Text(
                                                          'Добавить фото',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      174,
                                                                      42,
                                                                      39,
                                                                      1.0),
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 10),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          elevation: 0.0,
                                                          shadowColor: Colors
                                                              .transparent,
                                                        ),
                                                        onPressed: () {
                                                          getPicture(ImageSource
                                                              .gallery);
                                                        },
                                                      ),
                                                    )),
                                            ],
                                          )
                                        : SizedBox(
                                            width: 130,
                                            child: ElevatedButton.icon(
                                              icon: const Icon(
                                                color: Color.fromRGBO(
                                                    174, 42, 39, 1.0),
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
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0.0,
                                                shadowColor: Colors.transparent,
                                              ),
                                              onPressed: () {
                                                getPicture(ImageSource.gallery);
                                              },
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
                                Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                        height: 100,
                                        width: 170,
                                        child: TextField(
                                          controller: _infoController,
                                          maxLines: 10,
                                          style: const TextStyle(fontSize: 10),
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 20, left: 5),
                                            labelText:
                                                'Дополнительная информация',
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
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
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
                                  Navigator.pop(context, _skipObject());
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
                                    side: ((_city != '' &&
                                            _address != '' &&
                                            _house != '' &&
                                            _apartment != '' &&
                                            _foreManName != '')
                                        ? const BorderSide(
                                            width: 0.5,
                                            color: Color.fromRGBO(
                                                174, 42, 39, 1.0),
                                          )
                                        : const BorderSide(
                                            width: 0.5,
                                            color: Color.fromRGBO(
                                                122, 122, 122, 1.0),
                                          ))),
                                onPressed: () {
                                  Navigator.pop(context, _saveObject());
                                },
                                child: Text(
                                  'Сохранить',
                                  style: ((_city != '' &&
                                          _address != '' &&
                                          _house != '' &&
                                          _apartment != '' &&
                                          _foreManName != '')
                                      ? const TextStyle(
                                          color:
                                              Color.fromRGBO(174, 42, 39, 1.0),
                                        )
                                      : const TextStyle(
                                          color: Color.fromRGBO(
                                              122, 122, 122, 1.0),
                                        )),
                                )),
                            Container(
                                height: 35,
                                decoration: ((_city != '' &&
                                        _address != '' &&
                                        _house != '' &&
                                        _apartment != '' &&
                                        _foreManName != '')
                                    ? const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(187, 14, 42, 1.0),
                                              Color.fromRGBO(105, 0, 0, 1.0)
                                            ]),
                                      )
                                    : const BoxDecoration()),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    side: ((_city != '' &&
                                            _address != '' &&
                                            _house != '' &&
                                            _apartment != '' &&
                                            _foreManName != '')
                                        ? const BorderSide(
                                            style: BorderStyle.none)
                                        : const BorderSide(
                                            width: 0.5,
                                            color: Color.fromRGBO(
                                                122, 122, 122, 1.0),
                                          )),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context, _addObject());
                                  },
                                  child: Center(
                                      child: Text(
                                    'Добавить объект',
                                    style: ((_city != '' &&
                                            _address != '' &&
                                            _house != '' &&
                                            _apartment != '' &&
                                            _foreManName != '')
                                        ? const TextStyle(
                                            color: Colors.white,
                                          )
                                        : const TextStyle(
                                            color: Color.fromRGBO(
                                                122, 122, 122, 1.0),
                                          )),
                                  )),
                                )),
                          ])),
                ]),
              )));
    }));
  }
}
