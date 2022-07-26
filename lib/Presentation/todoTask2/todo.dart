import 'package:flutter/material.dart';
import 'package:task_1/Presentation/todoTask2/pages/home/home.dart';
import 'package:task_1/core/router/app_router.dart';

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
