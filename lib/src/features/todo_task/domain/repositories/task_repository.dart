import 'package:dartz/dartz.dart';
import 'package:task_1/src/core/error/failures.dart';
import 'package:task_1/src/features/todo_task/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, ToDoTask>> addTask();

// Future<Either<Failure, Task>> deleteTask();
}
