
import 'package:get/get.dart';
import 'package:todo/presentation/edit_todo/view/edit_todo_page.dart';
import 'package:todo/presentation/todo/view/todo_page.dart';

class AppRoutes {
  static const todoPage = '/';
  static const editTodoPage = '/edit';

  static final getPages = [
    GetPage(
      name: todoPage,
      page: () => const TodoPage(),
    ),
    GetPage(
      name: editTodoPage,
      page: () => const EditTodoPage(),
    ),
  ];
}
