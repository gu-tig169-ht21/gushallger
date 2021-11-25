import 'package:firstapp/api_page.dart';
import 'package:flutter/material.dart';

class TodoItem {
  String attGora;
  bool done = false;
  String id = "du har överskrivit idt";

  TodoItem({
    required this.attGora,
    required this.done,
    required this.id,
  });

  static Map<String, dynamic> toJson(TodoItem sak) {
    return {
      "title": sak.attGora,
      "done": sak.done,
      "id": sak.id,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      attGora: json["title"],
      done: json["done"],
      id: json["id"],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoItem> list = [];

  List<TodoItem> get lista => list;

  String _filterBy = "Alla";

  String get filterBy => _filterBy;

  Future fetchTodo() async {
    List<TodoItem> lista = await ApiPage.fetchTodo();
    list = lista;
    notifyListeners();
  }

  void addItem(TodoItem sak) async {
    await ApiPage.addTodo(sak);
    await fetchTodo();
    notifyListeners();
  }

  void addTodo(TodoItem sak) {
    list.add(sak);
    notifyListeners();
  }

  void removeItem(TodoItem sak) async {
    await ApiPage.deleteTodos(sak.id);
    await fetchTodo();
    notifyListeners();
  }

  void changeState(TodoItem sak, bool done) async {
    sak.done = !sak.done;
    await ApiPage.updateTodos(sak, sak.id);
    await fetchTodo();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
