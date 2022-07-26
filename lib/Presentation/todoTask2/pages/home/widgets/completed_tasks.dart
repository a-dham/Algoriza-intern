import 'package:flutter/material.dart';
import 'package:task_1/core/utils/size_config.dart';

class CompleteTasks extends StatelessWidget {
  CompleteTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  List<PopupMenuEntry> popupList = const [
    PopupMenuItem(child: Text('Complete')),
    PopupMenuItem(child: Text('UnComplete')),
    PopupMenuItem(child: Text('Favorite')),
    PopupMenuItem(child: Text('Delete')),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size * 2, horizontal: size * 1.8),
      child: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(value: true, onChanged: (value) {}),
              title: const Text('My first TASK'),
              trailing: PopupMenuButton(itemBuilder: (context) {
                return popupList;
              }),
            );
          }),
    );
  }
}
