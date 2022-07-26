import 'package:flutter/material.dart';
import 'package:task_1/core/customTextFormField.dart';
import 'package:task_1/core/custom_elevated_button.dart';
import 'package:task_1/core/utils/constant.dart';
import 'package:task_1/core/utils/size_config.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key? key,
  }) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  final TextEditingController titleTextController = TextEditingController();

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
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
          },
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
            SizedBox(
              height: size * 1.3,
            ),
            CustomeTextFormField(
              hintText: 'I Want to call mom ...',
              textEditingController: titleTextController,
              suffixWidget: null,
              prefixWidget: null,
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
              textEditingController: titleTextController,
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
                    textEditingController: titleTextController,
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
                    textEditingController: titleTextController,
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
              textEditingController: titleTextController,
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
            customText(text: 'Repeat'),
            SizedBox(
              height: size * 1.3,
            ),
            CustomeTextFormField(
              hintText: 'Weakly',
              textEditingController: titleTextController,
              prefixWidget: null,
              suffixWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: size * 2,
                  )),
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Create a Task',
              textColor: kWhiteColor,
              buttonColor: const Color(0XFF259963),
              circular: 10,
              onPressed: () {
                Navigator.pushNamed(context, addTask);
              },
              verticalPadding: size * 1.8,
              size: const Size(double.infinity, 10),
            )
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
