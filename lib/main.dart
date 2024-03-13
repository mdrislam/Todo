import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/app.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/inject_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoEntityAdapter());
  injectContainer();

  runApp(const App());
}
// https://github.com/halfmoon-mind/flutter_todo_example/tree/main/lib/presentation