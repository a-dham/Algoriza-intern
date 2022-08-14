import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/src/core/utils/size_config.dart';
import 'package:task_1/src/features/todo_task/Presentation/blocs/todo%20cubit/todo_cubit.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/all_tasks.dart';

class CompleteTasks extends StatelessWidget {
  CompleteTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  List<Map> completeTasks = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          TodoCubit cubit = TodoCubit.get(context);

          if (state is TaskUpdateSuccess) {
            completeTasks = cubit.completeTasks;
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size * 2, horizontal: size * 1.8),
              child: ListView.builder(
                  itemCount: completeTasks.length,
                  itemBuilder: (context, index) {
                    Map tasks = completeTasks[index];

                    return AllTasks().taskItem(tasks, context, cubit);
                  }),
            );
          } else {
            return Container();
          }
        });
  }
}
