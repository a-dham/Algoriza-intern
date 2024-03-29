import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/src/core/custom_elevated_button.dart';
import 'package:task_1/src/core/utils/app_colors.dart';
import 'package:task_1/src/core/utils/size_config.dart';
import 'package:task_1/src/features/todo_task/Presentation/blocs/todo%20cubit/todo_cubit.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/all_tasks.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/completed_tasks.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/favorite_tasks.dart';
import 'package:task_1/src/features/todo_task/Presentation/screens/home/widgets/uncompleted_tasks.dart';

import '../../../../../config/routes/app_router.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late double size = SizeConfig.defaultSize ?? 9.3;
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 0,
        animationDuration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    leadingWidth: 0,
                    toolbarHeight: size * 9,
                    elevation: 1,
                    backgroundColor: Colors.white,
                    title: const Text(
                      'Board',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBlackColor,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.schedule);
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.kBlackColor,
                        ),
                      )
                    ],
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border(
                            bottom: BorderSide(
                                color: AppColors.kGreyColor.withOpacity(0.5),
                                width: 1),
                          ),
                        ),
                        child: TabBar(
                          tabs: const [
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Completed',
                            ),
                            Tab(
                              text: 'Uncompleted',
                            ),
                            Tab(
                              text: 'Favorite',
                            ),
                          ],
                          controller: tabController,
                          onTap: (index) {},
                          indicatorColor: AppColors.kBlackColor,
                          isScrollable: true,
                          unselectedLabelColor: AppColors.kGreyColor,
                          unselectedLabelStyle: TextStyle(
                            fontSize: size * 1.7,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: TextStyle(
                            fontSize: size * 1.7,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.only(top: size),
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: size * 1.8,
                          ),
                          labelColor: AppColors.kBlackColor,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(controller: tabController, children: [
                          Tab(
                            child: AllTasks(),
                          ),
                          Tab(
                            child: CompleteTasks(),
                          ),
                          Tab(
                            child: UnCompleteTasks(),
                          ),
                          Tab(
                            child: FavoriteTasks(),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size * 3, vertical: size * 2),
                        child: CustomElevatedButton(
                          text: 'Add Task',
                          textColor: AppColors.kWhiteColor,
                          buttonColor: const Color(0XFF259963),
                          circular: 10,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.addTask);
                          },
                          verticalPadding: size * 1.8,
                          size: const Size(double.infinity, 10),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
