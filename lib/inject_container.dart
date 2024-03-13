import 'package:get/get.dart';
import 'package:todo/data/datasource/todo_local_datasource.dart';
import 'package:todo/data/repositories/todo_repository_impl.dart';
import 'package:todo/domain/repositories/todo_repository.dart';
import 'package:todo/domain/usecases/get_todos.dart';
import 'package:todo/domain/usecases/save_todos.dart';
import 'package:todo/presentation/todo/controller/todo_controller.dart';

injectContainer() {
  Get.put(TodoLocalDataSource());
  Get.put<TodoRepository>(TodoRepositoryImpl(Get.find()));
  Get.put(GetTodos(Get.find()));
  Get.put(SaveTodos(Get.find()));
  Get.put(TodoController(Get.find(), Get.find()));
}
