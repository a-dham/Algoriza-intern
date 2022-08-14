import 'package:dartz/dartz.dart';
import 'package:task_1/src/core/error/failures.dart';
import 'package:task_1/src/core/usecases/use_case.dart';
import 'package:task_1/src/features/todo_task/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class GetTask implements UseCase<ToDoTask, NoParams> {
  final TaskRepository taskRepository;

  GetTask({required this.taskRepository});

  @override
  Future<Either<Failure, ToDoTask>> call(NoParams param) {
    return taskRepository.addTask();
  }
}
