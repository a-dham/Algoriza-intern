import 'package:task_1/src/features/todo_task/domain/entities/task.dart';

class TaskModel extends ToDoTask {
  TaskModel({
    required super.title,
    required super.deadline,
    required super.startTime,
    required super.endTime,
    required super.remind,
    required super.repeat,
    required super.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      title: json['title'],
      deadline: json['deadline'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      remind: json['remind'],
      repeat: json['repeat'],
      status: json['status']);

// Map<String, dynamic> toJson
//
// => {
//
// 'title' : title,
// 'deadline' : startTime,
// 'title' : title,
// 'title' : title,
// 'title' : title,
//
// };

}
