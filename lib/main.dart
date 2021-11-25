import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'package:provider/provider.dart';
import './item_list_view.dart';

void main() {
  var state = MyState();
  state.fetchTodo();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eriks app",
      home: ItemListView(),
    );
  }
}
