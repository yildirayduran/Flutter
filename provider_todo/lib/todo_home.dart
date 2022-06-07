import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo/providers/all_provider.dart';
import 'package:provider_todo/widgets/title_widgets.dart';
import 'package:provider_todo/widgets/todo_list_item.dart';
import 'package:provider_todo/widgets/toolbar.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(filteredListTodo);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const TitleWidgets(),
            TextField(
              onSubmitted: (newTodo) {
                ref.read(todoListProvider.notifier).addTodo(newTodo);
              },
              controller: newTodoController,
              decoration: const InputDecoration(
                labelText: 'Neler Yapıcaksın ?',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const ToolBarWidgets(),
            for (var i = 0; i < allTodos.length; i++)
              Dismissible(
                onDismissed: (direction) {
                  ref.read(todoListProvider.notifier).removeTodo(allTodos[i]);
                },
                key: ValueKey(allTodos[i].id),
                child: ProviderScope(
                  overrides: [
                    currentTodoProvider.overrideWithValue(allTodos[i])
                  ],
                  child: const TodoListItemWidgets(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
