import 'package:flutter/material.dart';

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
    'Иванов Максим',
    style: TextStyle(
      fontSize: 12.0,
      color: Colors.red,
    ),
  );
}

Text _userPost() {
  return const Text(
    'администратор',
    style: TextStyle(
      fontSize: 9.0,
      color: Colors.grey,
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