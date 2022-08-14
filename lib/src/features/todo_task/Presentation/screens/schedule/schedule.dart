import 'package:flutter/material.dart';
import 'package:task_1/src/core/utils/size_config.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../core/utils/app_colors.dart';

class Schedule extends StatelessWidget {
  Schedule({Key? key}) : super(key: key);
  List<String> days = [
    '',
  ];

  @override
  Widget build(BuildContext context) {
    double size = SizeConfig.defaultSize!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kBlackColor,
            )),
        toolbarHeight: size * 9,
        elevation: 1,
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.only(
                    top: size * 1.5,
                    bottom: size * 1.5,
                    right: size,
                    left: size),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(
                    bottom: BorderSide(
                        color: AppColors.kGreyColor.withOpacity(0.5), width: 1),
                  ),
                ),
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(right: size),
                          padding: EdgeInsets.only(
                            top: size,
                            bottom: size,
                          ),
                          width: size * 4.5,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              const Text('sun',
                                  style: TextStyle(
                                    color: AppColors.kWhiteColor,
                                  )),
                              SizedBox(
                                height: size,
                              ),
                              Text(DateTime.now().day.toString(),
                                  style: const TextStyle(
                                    color: AppColors.kWhiteColor,
                                  )),
                            ],
                          ));
                    })),
          ),
          const Expanded(flex: 7, child: SizedBox())
        ],
      ),
    );
  }
}
