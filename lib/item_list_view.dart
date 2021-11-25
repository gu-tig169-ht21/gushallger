import 'package:firstapp/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_todo.dart';
import 'item_list.dart';

class ItemListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dina ToDo:s"),
        actions: [
          PopupMenuButton(
              onSelected: (String value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Alla"),
                      value: "Alla",
                    ),
                    PopupMenuItem(
                      child: Text("Klara"),
                      value: "Klara",
                    ),
                    PopupMenuItem(
                      child: Text("Ej Klara"),
                      value: "ejKlara",
                    ),
                  ])
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) => ItemList(
                _filterList(state.list, state.filterBy),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newSak = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodo(
                      todo:
                          TodoItem(attGora: "", done: false, id: "temp id"))));
          if (newSak != null) {
            Provider.of<MyState>(context, listen: false).addItem(newSak);
          }
        },
      ),
    );
  }

  List<TodoItem> _filterList(list, filterBy) {
    if (filterBy == "Alla") return list;
    if (filterBy == "Klara")
      return list.where((sak) => sak.done == true).toList();
    if (filterBy == "ejKlara")
      return list.where((sak) => sak.done == false).toList();
    else
      return list;
  }
}
