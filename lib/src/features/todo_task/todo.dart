import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/app_router.dart';
import '../../core/utils/app_strings.dart';
import 'Presentation/blocs/todo cubit/todo_cubit.dart';

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDB(),
      child: MaterialApp(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
