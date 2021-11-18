import 'package:flutter/material.dart';
import './saker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          }),
      body: Center(
        child: Column(children: [
          //image(),
          item("Handla mjölk", true),
          item("Studera med todd", false),
          item("Handla Mjölk", false),
          item("Läsa på om Flutter", true),
          item("Lämna in på GitHub", true),
        ]),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      body: list(),
    );
  }
}
