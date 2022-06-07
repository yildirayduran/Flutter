import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo/providers/todo_list_manager.dart';

import '../models/todo_models.dart';

enum TodoListFilter { all, active, completed }

final todoListFilter =
    StateProvider<TodoListFilter>((ref) => TodoListFilter.all);

final filteredListTodo = Provider<List<TodoModel>>(
  (ref) {
    final filter = ref.watch(todoListFilter);
    final todoList = ref.watch(todoListProvider);

    switch (filter) {
      case TodoListFilter.all:
        return todoList;
      case TodoListFilter.active:
        return todoList.where((element) => element.complete).toList();
      case TodoListFilter.completed:
        return todoList.where((element) => !element.complete).toList();
    }
  },
);
final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    //TodoModel(const Uuid().v4(), 'Spor Zamanı', false),
    //TodoModel(const Uuid().v4().toString(), 'Alışveriş Zamanı', false)
  ]);
});

final currentTodoProvider = Provider<TodoModel>(
  (ref) {
    throw UnimplementedError();
  },
);
