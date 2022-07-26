import 'package:flutter/material.dart';
import 'package:task_1/core/customTextFormField.dart';
import 'package:task_1/core/utils/constant.dart';
import 'package:task_1/core/utils/size_config.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final double size = SizeConfig.defaultSize!;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            color: kBlackColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: size * 1.8,
            color: kBlackColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customText(text: 'Title'),
            CustomeTextFormField(
              hintText: 'I Want to call mom ...',
            ),
            customText(text: 'Deadline'),
            customText(text: 'Start Time'),
            customText(text: 'End Time'),
            customText(text: 'Remind'),
            customText(text: 'Repeat'),
          ],
        ),
      ),
    );
  }
}

Widget customText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: kBlackColor,
      fontSize: 18,
    ),
  );
}
