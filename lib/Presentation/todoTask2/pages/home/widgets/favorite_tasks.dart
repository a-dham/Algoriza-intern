import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/Presentation/todoTask2/pages/home/widgets/all_tasks.dart';
import 'package:task_1/business%20logic%20layer/todo%20cubit/todo_cubit.dart';
import 'package:task_1/core/utils/size_config.dart';

class FavoriteTasks extends StatelessWidget {
  FavoriteTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.get(context);
          List<Map> tasksl = TodoCubit.get(context).favoriteList;
          if (tasksl.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size * 2, horizontal: size * 1.8),
              child: ListView.builder(
                  itemCount: tasksl.length,
                  itemBuilder: (context, index) {
                    Map tasks = tasksl[index];

                    return AllTasks().taskItem(tasks, context, cubit);
                  }),
            );
          } else {
            return Container();
          }
        });
  }
}
