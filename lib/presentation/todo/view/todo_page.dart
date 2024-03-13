import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/usecases/get_todos.dart';
import 'package:todo/domain/usecases/save_todos.dart';
import 'package:todo/presentation/edit_todo/view/edit_todo_page.dart';
import 'package:todo/presentation/todo/controller/todo_controller.dart';
import 'package:todo/presentation/todo/view/components/todo_widgets.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(Get.find<GetTodos>(), Get.find<SaveTodos>()),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Todo'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Todo', icon: Icon(Icons.list)),
                    Tab(text: 'Done', icon: Icon(Icons.check)),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.textEditController.clear();
                      Get.to(() => const EditTodoPage());
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              body: TabBarView(children: [
                Obx(() {
                  final inProgressTodos =
                      controller.todos.where((t) => !t.isCompleted).toList();
                  return _buildTodoList(inProgressTodos);
                }),
                Obx(() {
                  final completedTodos =
                      controller.todos.where((t) => t.isCompleted).toList();
                  return _buildTodoList(completedTodos);
                })
              ]),
            ),
          );
        });
  }

  Widget _buildTodoList(List<TodoEntity> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index].obs;
        return TodoWidget(todo: todo, key: Key(todo.value.id));
      },
    );
  }
}
