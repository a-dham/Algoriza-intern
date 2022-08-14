import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);
  late Database database;
  List<Map> tasks = [];
  List<Map> unCompleteTasks = [];
  List<Map> completeTasks = [];
  List<Map> favoriteTasks = [];
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController startTimeTextController = TextEditingController();
  final TextEditingController endTimeTextController = TextEditingController();
  final TextEditingController deadlineTextController = TextEditingController();
  final TextEditingController remindTextController = TextEditingController();
  final TextEditingController repeatTextController = TextEditingController();

  // open the database
  createDB() async {
    database = await openDatabase('tOdo.db', version: 1,
        onCreate: (Database db, int version) async {
      debugPrint('dataBas created');
      await db.execute('CREATE TABLE Tasks('
          'id INTEGER PRIMARY KEY,'
          'status Text,'
          'title TEXT,'
          'deadline TEXT,'
          'startTime TEXT,'
          'endTime TEXT,'
          'remind TEXT,'
          'repeat TEXT'
          ')');
    }, onOpen: (Database db) {
      debugPrint('database opened');
      database = db;
      getDB();
    });
  }

  // insert row
  insertDB() async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO Tasks(status, title, deadline, startTime, endTime, remind, repeat) VALUES("new", "${titleTextController.text}", "${deadlineTextController.text}", "${startTimeTextController.text}", "${endTimeTextController.text}","${remindTextController.text}", "${repeatTextController.text}" )');
    }).then((value) {
      debugPrint('$value inserted success');
      clearTextFormField();
      getDB();
      emit(TaskInsertSuccess());
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      emit(TaskInsertError());
    });
  }

  //get DB
  void getDB() async {
    emit(TasksGetLoading());
    await database.rawQuery('SELECT * FROM Tasks').then((value) {
      debugPrint('Tasks Fetched');
      // for (var element in value) {
      //   if (element['status'] == 'favorite') {
      //     favoriteTasks.add(element);
      //   } else if (element['status'] == 'complete') {
      //     completeTasks.add(element);
      //   } else if (element['status'] == 'unComplete') {
      //     unCompleteTasks.add(element);
      //   }
      // }
      emit(TasksGetSuccess(
        tasks: value,
      ));
    });
  }

//update DB
  upDateDB({
    required String status,
    required int id,
  }) async {
    await database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = $id ', [status]).then((value) {
      getDB();
      emit(TaskUpdateSuccess());
    });
  }

//delete DB
  deleteDB({required int id}) async {
    await database
        .rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getDB();
      emit(TaskDeleteSuccess());
    });
  }

//clear text form field
  clearTextFormField() {
    titleTextController.clear();
    startTimeTextController.clear();
    endTimeTextController.clear();
    deadlineTextController.clear();
    remindTextController.clear();
    repeatTextController.clear();
  }

//change checkBox
  bool isChecked = false;

  chekBox() {
    isChecked = !isChecked;
    emit(ChangeCheckBox());
  }
}
