import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;
  GetTodos(this.repository);
  Future<List<TodoEntity>> call() async {
    return await repository.getTodos();
  }
}
