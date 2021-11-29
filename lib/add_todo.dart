import 'package:firstapp/api.dart';
import "package:flutter/material.dart";
import "todo_item.dart";

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key, required this.todo}) : super(key: key);

  final TodoItem todo;

  @override
  State<AddTodo> createState() => AddTodoState(todo);
}

class AddTodoState extends State<AddTodo> {
  late String attGora;
  late bool done;
  late String id;

  late TextEditingController textEditingController;

  AddTodoState(TodoItem sak) {
    this.attGora = sak.attGora;
    this.done = sak.done;
    this.id = sak.id;

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
                Navigator.pop(context,
                    TodoItem(attGora: attGora, done: done, id: "temp id"));
              },
              child: const Text(
                "ADD",
                style: TextStyle(color: Colors.white),
              ))
        ]),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    hintText: "Vad vill du lägga till i din lista?"),
              ),
            ),
          ),
        ));
  }
}
