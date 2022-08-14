import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/task1/Auth/Login/login_screen.dart';
import '../../features/task1/Auth/signUp/sign_up_screen.dart';
import '../../features/task1/onboarding/on_boarding.dart';
import '../../features/todo_task/Presentation/blocs/todo cubit/todo_cubit.dart';
import '../../features/todo_task/Presentation/screens/addTask/add_task.dart';
import '../../features/todo_task/Presentation/screens/home/home.dart';
import '../../features/todo_task/Presentation/screens/schedule/schedule.dart';

class Routes {
//Route Names
  static const String onBoarding = '/onBoarding';
  static const String signUp = '/signUp';
  static const String login = '/login';
  static const String home = '/';
  static const String addTask = '/addTask';
  static const String schedule = '/schedule';
}

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          switch (settings.name) {
            case Routes.onBoarding:
              return const OnBoarding();
            case Routes.signUp:
              return const SignUpScreen();
            case Routes.login:
              return const LoginScreen();
            case Routes.home:
              return const Home();
            case Routes.schedule:
              return Schedule();

            case Routes.addTask:
              return BlocProvider<TodoCubit>(
                  create: (context) => TodoCubit()..createDB(),
                  child: AddTask());
          }
          return const Home();
        });
  }
}
