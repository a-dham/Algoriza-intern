import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_1/src/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

// class TaskUseCaseInput extends Equatable {
//   final String title;
//   final String deadline;
//   final String startTime;
//   final String endTime;
//   final String remind;
//   final String repeat;
//   final String status;
//
//   const TaskUseCaseInput({
//     required this.title,
//     required this.deadline,
//     required this.startTime,
//     required this.endTime,
//     required this.remind,
//     required this.repeat,
//     required this.status,
//
//   });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props =>
//       [title,
//         deadline,
//         startTime,
//         endTime,
//         remind,
//         repeat,
//         status,
//       ];
//
//
// }
