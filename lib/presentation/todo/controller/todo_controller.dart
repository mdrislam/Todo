import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/usecases/get_todos.dart';
import 'package:todo/domain/usecases/save_todos.dart';

class TodoController extends GetxController {
  final GetTodos getTodos;
  final SaveTodos saveTodos;
  final textEditController = TextEditingController();
  TodoController(this.getTodos, this.saveTodos);
  final todos = <TodoEntity>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    loadTodos();
    super.onInit();
  }

  Future<void> loadTodos() async {
    final result = await getTodos();
    todos.value = result;
    update();
  }

  void addTodo(TodoEntity todo) {
    todos.add(todo);
    saveTodos(todos);
    textEditController.clear();
    update();
  }

  void toggleIsCompleted(TodoEntity todo) {
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo.copyWith(isCompleted: !todo.isCompleted);
    saveTodos(todos);
    update();
  }

  void editTodo(TodoEntity todo) {
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo;
    saveTodos(todos);
    textEditController.clear();
    update();
  }
}
