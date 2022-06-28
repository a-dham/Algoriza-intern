import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task_1/app_router.dart';

import 'screens/onboarding/on_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
