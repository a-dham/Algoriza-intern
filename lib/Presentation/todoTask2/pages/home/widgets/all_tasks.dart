import 'package:flutter/material.dart';
import 'package:task_1/core/utils/size_config.dart';

class AllTasks extends StatelessWidget {
  AllTasks({Key? key}) : super(key: key);
  final double size = SizeConfig.defaultSize!;
  final List<PopupMenuEntry> popupList = const [
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
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Transform.scale(
                scale: size / 6,
                child: Checkbox(
                  value: true,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        const BorderSide(width: 1.0, color: Colors.green),
                  ),
                ),
              ),
              title: const Text('My first TASK'),
              trailing: PopupMenuButton(itemBuilder: (context) {
                return popupList;
              }),
            );
          }),
    );
  }
}
