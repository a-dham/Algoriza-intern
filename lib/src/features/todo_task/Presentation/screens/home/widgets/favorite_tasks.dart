import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/src/core/utils/size_config.dart';
import 'package:task_1/src/features/todo_task/Presentation/blocs/todo%20cubit/todo_cubit.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/all_tasks.dart';

class FavoriteTasks extends StatelessWidget {
  FavoriteTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.get(context);
          List<Map> taskList = TodoCubit.get(context).favoriteTasks;
          if (taskList.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size * 2, horizontal: size * 1.8),
              child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    Map tasks = taskList[index];

                    return AllTasks().taskItem(tasks, context, cubit);
                  }),
            );
          } else {
            return Container();
          }
        });
  }
}
