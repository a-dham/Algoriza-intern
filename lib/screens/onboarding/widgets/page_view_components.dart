import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PageViewComponents extends StatelessWidget {
  const PageViewComponents({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          height: 35.h,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
