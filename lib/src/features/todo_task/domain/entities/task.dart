import 'package:equatable/equatable.dart';

class ToDoTask extends Equatable {
  final String title;
  final String deadline;
  final String startTime;
  final String endTime;
  final String remind;
  final String repeat;
  final String status;

  const ToDoTask({
    required this.title,
    required this.deadline,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        deadline,
        startTime,
        endTime,
        remind,
        repeat,
        status,
      ];
}
