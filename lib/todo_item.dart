import 'package:flutter/material.dart';


class TodoItem {
  String attGora;
  bool done = false;

  TodoItem({required this.attGora, required this.done});
}

class MyState extends ChangeNotifier {
  List<TodoItem> list = [];

  List<TodoItem> get lista => list;

  String _filterBy = "Alla";

  String get filterBy => _filterBy;

  void addTodo(TodoItem sak) {
    list.add(sak);
    notifyListeners();
  }

  void removeItem(TodoItem sak) {
    list.remove(sak);
    notifyListeners();
  }

  void changeState(
    TodoItem sak,
  ) {
    sak.done = !sak.done;
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
