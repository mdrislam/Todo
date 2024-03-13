import 'package:todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> saveTodos(List<TodoEntity> todos);
}
