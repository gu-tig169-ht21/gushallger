import 'package:flutter/material.dart';
import 'todo_item.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key, required this.todo}) : super(key: key);

  final TodoItem todo;

  @override
  State<AddTodo> createState() => AddTodoState(todo);
}

class AddTodoState extends State<AddTodo> {
  late String attGora;
  late bool done;

  late TextEditingController textEditingController;

  AddTodoState(TodoItem sak) {
    this.attGora = sak.attGora;
    this.done = sak.done;

    textEditingController = TextEditingController(text: sak.attGora);

    textEditingController.addListener(() {
      setState(() {
        attGora = textEditingController.text;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lägg till Todo"), actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, TodoItem(attGora: attGora, done: done));
              },
              child: Text(
                "ADD",
                style: TextStyle(color: Colors.white),
              ))
        ]),
        body: Center(
          child: Container(
            width: 325.0,
            child: TextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20)),
                controller: textEditingController),
          ),
        ));
  }
}
