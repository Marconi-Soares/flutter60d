import 'package:flutter/material.dart';
import 'package:todo0/constants/colors.dart';
import 'package:todo0/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final Function onDeleteItem;
  final Function onTodoChanged;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onDeleteItem,
    required this.onTodoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        onTap: () => onTodoChanged(todo),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          '${todo.todoText}',
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: SizedBox(
          height: 50,
          width: 50,
          child: IconButton(
            icon: const Icon(Icons.delete),
            iconSize: 20,
            onPressed: () => onDeleteItem(todo.id),
          ),
        ),
      ),
    );
  }
}
