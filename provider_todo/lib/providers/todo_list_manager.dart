import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_todo/models/todo_models.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodo]) : super(initialTodo ?? []);

  void addTodo(String dects) {
    state = [...state, TodoModel(const Uuid().v4(), dects, false)];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(todo.id, todo.desc, !todo.complete)
        else
          todo
    ];
  }

  void editTodo({required String id, required String newDecs}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(todo.id, todo.desc, todo.complete)
        else
          todo
    ];
  }

  void removeTodo(TodoModel silinecekTodo) {
    state = state.where((todo) => todo.id != silinecekTodo.id).toList();
  }

//tamamlanmamış görevlerin sayısı
  int onCompletedTodoCount() {
    return state.where((element) => !element.complete).length;
  }
}
