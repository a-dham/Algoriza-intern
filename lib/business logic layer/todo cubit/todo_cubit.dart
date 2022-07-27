import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);
  late Database database;
  List<Map>? dataList;

  createDB() async {
    // open the database
    database = await openDatabase('tOdo.db', version: 1,
        onCreate: (Database db, int version) async {
          print('dataBas created');

          await db
              .execute(
              'CREATE TABLE Tasks(id INTEGER PRIMARY KEY, status Text, title TEXT, deadline TEXT, startTime TEXT, endTime TEXT, remind TEXT, repeat TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print(error.toString());
          });
        }, onOpen: (Database db) {
          print('databas opened');
        });
  }

  Future insertDB({
    required String status,
    required String title,
    required String deadline,
    required String startTime,
    required String endTime,
    required String remind,
    required String repeat,
  }) async {
    await createDB();
    await database.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO Tasks(status, title, deadLine, startTime, endTime, remind, repeat) VALUES("$status","$title","$startTime","$deadline","$endTime","$remind","$repeat")',
      )
          .then((value) {
        print('$value inserted success');
      }).catchError((error) {
        print(error.toString());
      });
    });
  }

  getDB() async {
    dataList = await database.rawQuery('SELECT * FROM Tasks');
    print(dataList);
  }
}
