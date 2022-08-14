import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_1/src/core/customTextFormField.dart';
import 'package:task_1/src/core/custom_elevated_button.dart';
import 'package:task_1/src/core/utils/size_config.dart';
import 'package:task_1/src/features/todo_task/Presentation/blocs/todo%20cubit/todo_cubit.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../core/utils/app_colors.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TodoCubit cubit = TodoCubit.get(context);
    return BlocConsumer<TodoCubit, TodoState>(listener: (context, state) {
      if (state is TaskInsertSuccess) {
        Navigator.pop(context, Routes.home);
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: size * 9,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Add Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.kBlackColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: size * 1.8,
              color: AppColors.kBlackColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(size * 4),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customText(text: 'Title'),
                  SizedBox(
                    height: size * 1.3,
                  ),
                  CustomeTextFormField(
                    hintText: 'I Want to ...',
                    textEditingController: cubit.titleTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title Must Not Be Empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    suffixWidget: null,
                    prefixWidget: null,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size * 3,
                  ),
                  customText(text: 'Deadline'),
                  SizedBox(
                    height: size * 1.3,
                  ),
                  CustomeTextFormField(
                    hintText: '2021-02-02',
                    keyboardType: TextInputType.none,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2022-12-31'))
                          .then((value) {
                        cubit.deadlineTextController.text =
                            DateFormat.yMMMMd().format(value!).toString();
                      }).catchError((error) {
                        debugPrint(error.toString());
                      });
                    },
                    textEditingController: cubit.deadlineTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deadline Must Not Be Empty';
                      }
                      return null;
                    },
                    prefixWidget: null,
                    suffixWidget: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: size * 2,
                        )),
                  ),
                  SizedBox(
                    height: size * 3,
                  ),
                  Row(
                    children: [
                      customText(text: 'Start Time'),
                      const Spacer(),
                      customText(text: 'End Time'),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: size * 1.3,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomeTextFormField(
                          hintText: '11:00 Am',
                          keyboardType: TextInputType.none,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              cubit.startTimeTextController.text =
                                  value!.format(context).toString();
                            }).catchError((error) {
                              debugPrint(error.toString());
                            });
                          },
                          textEditingController: cubit.startTimeTextController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Start Time Must Not Be Empty';
                            }
                            return null;
                          },
                          prefixWidget: null,
                          suffixWidget: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.access_time_rounded,
                                size: size * 2,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size,
                      ),
                      Expanded(
                        child: CustomeTextFormField(
                          hintText: '14:00 Pm',
                          keyboardType: TextInputType.none,
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              cubit.endTimeTextController.text =
                                  value!.format(context).toString();
                            }).catchError((error) {
                              debugPrint(error.toString());
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'End Time Must Not Be Empty';
                            }
                            return null;
                          },
                          textEditingController: cubit.endTimeTextController,
                          prefixWidget: null,
                          suffixWidget: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.access_time_rounded,
                                size: size * 2,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size * 3,
                  ),
                  customText(text: 'Remind'),
                  SizedBox(
                    height: size * 1.3,
                  ),
                  CustomeTextFormField(
                    hintText: '10 Minutes early',
                    textEditingController: cubit.remindTextController,
                    prefixWidget: null,
                    suffixWidget: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: size * 2,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Remind Must Not Be Empty';
                      }
                      return null;
                    },
                    keyboardType: null,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size * 3,
                  ),
                  customText(text: 'Repeat'),
                  SizedBox(
                    height: size * 1.3,
                  ),
                  CustomeTextFormField(
                    hintText: 'Weakly',
                    textEditingController: cubit.repeatTextController,
                    prefixWidget: null,
                    onTap: () {},
                    suffixWidget: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: size * 2,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Repeat Must Not Be Empty';
                      }
                      return null;
                    },
                    keyboardType: null,
                  ),
                  SizedBox(
                    height: size * 3,
                  ),
// BlocConsumer(
//   builder: (context, state) {
//     return Container();
//   },
// )

                  CustomElevatedButton(
                    text: 'Create a Task',
                    textColor: AppColors.kWhiteColor,
                    buttonColor: const Color(0XFF259963),
                    circular: 10,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint('validate done');
                        cubit.insertDB();
                      }
                    },
                    verticalPadding: size * 1.8,
                    size: const Size(double.infinity, 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget customText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.kBlackColor,
      fontSize: 18,
    ),
  );
}
