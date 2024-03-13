import 'package:hive/hive.dart';
import 'package:todo/domain/entities/todo_entity.dart';

class TodoLocalDataSource {
  final String _boxname = 'todos';
  Future<Box<TodoEntity>> get _todoBox async => await Hive.openBox(_boxname);

  Future<List<TodoEntity>> getTodos() async {
    final box = await _todoBox;
    return box.values.toList();
  }

  Future<void> saveTodos(List<TodoEntity> todos) async {
    final box = await _todoBox;
    for (final todo in todos) {
      await box.put(todo.id, todo);
    }
  }
}
