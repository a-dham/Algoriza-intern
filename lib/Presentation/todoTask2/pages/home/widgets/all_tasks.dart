import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/business%20logic%20layer/todo%20cubit/todo_cubit.dart';
import 'package:task_1/core/utils/constant.dart';
import 'package:task_1/core/utils/size_config.dart';

class AllTasks extends StatelessWidget {
  AllTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  List<Map> tasks = [];

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = TodoCubit.get(context);
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        tasks = cubit.dataList;

        if (tasks.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: size * 2, horizontal: size * 1.8),
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return taskItem(tasks[index], context, cubit);
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget taskItem(Map tasks, context, cubit) {
    final List<PopupMenuEntry> popupList = [
      PopupMenuItem(
          child: const Text('Complete'),
          onTap: () {
            cubit.upDateDB(status: 'complete', id: tasks['id']);
          }),
      PopupMenuItem(
          child: const Text('UnComplete'),
          onTap: () {
            cubit.upDateDB(status: 'unComplete', id: tasks['id']);
          }),
      PopupMenuItem(
          child: const Text('Favorite'),
          onTap: () {
            cubit.upDateDB(status: 'favorite', id: tasks['id']);
          }),
      PopupMenuItem(
          child: const Text('Delete'),
          onTap: () {
            cubit.deleteDB(id: tasks['id']);
          }),
    ];
    return ListTile(
      leading: Transform.scale(
        scale: size / 6,
        child: Checkbox(
          value: false,
          onChanged: (value) {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          activeColor: Colors.green,
          checkColor: Colors.white,
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.0, color: Colors.green),
          ),
        ),
      ),
      title: Text(tasks['title']),
      trailing: PopupMenuButton(itemBuilder: (context) {
        return popupList;
      }),
    );
  }
}
