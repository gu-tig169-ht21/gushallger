import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_item.dart';

class ItemList extends StatefulWidget {
  final List<TodoItem> list;

  ItemList(this.list);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => item(context, widget.list[index]),
      itemCount: widget.list.length,
    );
  }

  Widget item(context, sak) {
    return ListTile(
        leading: Checkbox(
          activeColor: Colors.blue,
          value: sak.done,
          onChanged: (bool? done) {
            Provider.of<MyState>(context, listen: false)
                .changeState(sak, sak.done);
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
