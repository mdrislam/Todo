import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/presentation/todo/controller/todo_controller.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();
    final TodoEntity? todo = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.textEditController,
            decoration: const InputDecoration(
              labelText: 'Todo Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (todo == null) {
                controller.addTodo(
                  TodoEntity(
                    DateTime.now().millisecondsSinceEpoch.toString(),
                    controller.textEditController.text,
                    false,
                  ),
                );
              } else {
                controller.editTodo(
                  todo.copyWith(
                    title: controller.textEditController.text,
                  ),
                );
              }
              Get.back();
            },
            child: todo == null ? const Text('Save') : const Text('Update'),
          ),
        ],
      ),
    );
  }
}
