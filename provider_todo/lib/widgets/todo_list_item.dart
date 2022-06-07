// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo/providers/all_provider.dart';

class TodoListItemWidgets extends ConsumerStatefulWidget {
  const TodoListItemWidgets({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetsState();
}

class _TodoListItemWidgetsState extends ConsumerState<TodoListItemWidgets> {
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTodoItem = ref.watch(currentTodoProvider);
    return Focus(
      onFocusChange: (isFocus) {
        if (!isFocus) {
          setState(() {
            hasFocus = false;
          });
          ref.read(todoListProvider.notifier).editTodo(
              id: currentTodoItem.id, newDecs: textEditingController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            hasFocus = true;
            focusNode.requestFocus();
            textEditingController.text = currentTodoItem.desc;
          });
        },
        title: hasFocus
            ? TextField(
                controller: textEditingController,
                focusNode: focusNode,
              )
            : Text(currentTodoItem.desc),
        leading: Checkbox(
            value: currentTodoItem.complete,
            onChanged: (value) {
              ref.read(todoListProvider.notifier).toggle(currentTodoItem.id);
            }),
      ),
    );
  }
}
