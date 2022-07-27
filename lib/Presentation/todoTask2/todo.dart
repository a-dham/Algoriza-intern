import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/Presentation/todoTask2/pages/home/home.dart';
import 'package:task_1/business%20logic%20layer/todo%20cubit/todo_cubit.dart';
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
