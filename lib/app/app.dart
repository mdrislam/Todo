import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/route/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todo Example Getx',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      initialRoute: AppRoutes.todoPage,
      getPages: AppRoutes.getPages,
    );
  }
}
