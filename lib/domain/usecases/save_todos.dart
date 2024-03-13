import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

class SaveTodos {
  final TodoRepository repository;
  SaveTodos(this.repository);
  Future<void> call(List<TodoEntity> todos) async {
    return await repository.saveTodos(todos);
  }
}
