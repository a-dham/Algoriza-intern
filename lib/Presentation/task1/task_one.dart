import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task_1/core/router/app_router.dart';

class TaskOne extends StatelessWidget {
  TaskOne({Key? key}) : super(key: key);

  AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const OnBoarding(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
