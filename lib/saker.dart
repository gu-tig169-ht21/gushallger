import 'package:flutter/material.dart';

import 'main.dart';
// import 'dart:html';

class Fragor extends StatelessWidget {
  String frageText;
  Fragor(this.frageText);
  @override
  Widget build(BuildContext context) {
    return Text(frageText);
  }
}

Widget item(String attGora, bool done) {
  return ListTile(
    leading: Checkbox(
      value: done,
      onChanged: (val) {},
    ),
    title: Text(
      attGora,
      style: _textStyle(done),
    ),
    trailing: Icon(Icons.delete_forever_outlined),
  );
}

TextStyle _textStyle(done) {
  if (done) {
    return TextStyle(fontSize: 24, decoration: TextDecoration.lineThrough);
  } else {
    return TextStyle(fontSize: 24);
  }
}

Widget fyrkant() {
  return Container(
    width: 150,
    height: 150,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.blue, border: Border.all(width: 3, color: Colors.yellow)),
  );
}

Widget checkBoxRow() {
  return Row(
    children: [
      Checkbox(
        value: true,
        onChanged: (val) {},
      ),
      Text("kontakta mig"),
    ],
  );
}

Widget image() {
  return Stack(
    children: [
      Image(image: AssetImage("./bild.jpeg")),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(0, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 15,
          left: 21,
          child: Text(
            "en vacker bild bara",
          )),
    ],
  );
}

Widget appBar2() {
  return Container(
      height: 53,
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: Text(
          'Titel',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ));
}

Widget nameLabel() {
  return Container(
    margin: EdgeInsets.only(left: 16, top: 24),
    child: Text('Name'),
  );
}

Widget nameInputField() {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 24),
    child: TextField(
      decoration: InputDecoration(hintText: 'Your Name'),
    ),
  );
}

Widget checkboxRow() {
  return Row(
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {},
      ),
      Text('Contact me'),
    ],
  );
}

Widget iconRow() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(left: 16, right: 20),
        child: Icon(Icons.person),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Heading', style: TextStyle(fontSize: 20)),
          Text('Subheading'),
        ],
      )
    ],
  );
}

Widget buttonRow() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    OutlineButton(
      onPressed: () {},
      child: Text('Cansel'),
    ),
    Container(width: 20),
    RaisedButton(
      onPressed: () {},
      child: Text('Save'),
      color: Colors.white,
    )
  ]);
}

Widget sak() {
  return Stack(
    children: [
      Container(
        height: 40,
      )
    ],
  );
}

Widget list() {
  return ListView(
    children: [
      nameInputField1(),
      addRow(),
    ],
  );
}

Widget addRow() {
  return Row(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Container(
        margin: EdgeInsets.only(left: 80, right: 80),
      ),
      Icon(Icons.add),
      Text(
        'Add',
      ),
    ],
  );
}

Widget nameInputField1() {
  return Container(
    margin: EdgeInsets.all(50),
    height: 50,
    child: TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'What are you going to do?'),
    ),
  );
}
