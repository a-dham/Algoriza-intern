import 'package:flutter/material.dart';
import 'package:task_1/core/custom_elevated_button.dart';
import 'package:task_1/core/utils/constant.dart';
import 'package:task_1/core/utils/size_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late double size = SizeConfig.defaultSize!;
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
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: size * 9,
              elevation: 1,
              backgroundColor: Colors.white,
              title: const Text(
                'Board',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: kBlackColor,
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border(
                      bottom: BorderSide(
                          color: kGreyColor.withOpacity(0.5), width: 1),
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
                    indicatorColor: kBlackColor,
                    isScrollable: true,
                    unselectedLabelColor: kGreyColor,
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
                    labelColor: kBlackColor,
                  ),
                ),
                Expanded(
                  child: TabBarView(controller: tabController, children: const [
                    Tab(
                      child: Center(
                        child: Text('all'),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text('complete'),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text('uncomplete'),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Text('favorite'),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size * 3, vertical: size * 2),
                  child: CustomElevatedButton(
                    text: 'Add Task',
                    textColor: kWhiteColor,
                    buttonColor: const Color(0XFF259963),
                    circular: 10,
                    onPressed: () {
                      Navigator.pushNamed(context, addTask);
                    },
                    verticalPadding: size * 1.8,
                    size: const Size(double.infinity, 10),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
