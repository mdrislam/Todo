import 'package:todo/data/datasource/todo_local_datasource.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<TodoEntity>> getTodos() {
    return localDataSource.getTodos();
  }

  @override
  Future<void> saveTodos(List<TodoEntity> todos) {
    return localDataSource.saveTodos(todos);
  }
}
