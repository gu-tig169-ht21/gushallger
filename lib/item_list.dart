import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_item.dart';

class ItemList extends StatelessWidget {
  final List<TodoItem> list;

  ItemList(this.list);

  Widget build(BuildContext context) {
    return ListView(children: list.map((sak) => item(context, sak)).toList());
  }

  Widget item(context, sak) {
    return ListTile(
        leading: Checkbox(
          activeColor: Colors.blue,
          value: sak.done,
          onChanged: (bool? done) {
            Provider.of<MyState>(context, listen: false).changeState(sak);
          },
        ),
        title: Text(
          sak.attGora,
          style: textStyle(sak.done),
        ),
        trailing: IconButton(
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeItem(sak);
            },
            icon: Icon(Icons.delete)));
  }
}

TextStyle textStyle(done) {
  if (done) {
    return TextStyle(fontSize: 24, decoration: TextDecoration.lineThrough);
  } else {
    return TextStyle(fontSize: 24);
  }
}
