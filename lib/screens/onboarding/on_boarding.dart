import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5.h, right: 4.w, left: 4.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Skip'),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),

            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: PageView(
                reverse: false,
                onPageChanged: (index) {

                },

                children: [
                  PageViewComponents(
                    image: 'assets/images/1.png',
                    title: 'Get Food delivery to Your\ndoorStep asap',
                    description:
                    'We have young and professional delivery \nteam that will bring your food as soon as \npossible to your doorstep',
                  ),
                  PageViewComponents(
                    image: 'assets/images/2.png',
                    title: 'Buy Any Food From your \nfavorite restaurant',
                    description:
                    'We have young and professional delivery \nteam that will bring your food as soon as \npossible to your doorstep',
                  ),
                  PageViewComponents(
                    image: 'assets/images/3.png',
                    title: 'Get Food delivery to Your\ndoorStep asap',
                    description:
                    'We have young and professional delivery \nteam that will bring your food as soon as \npossible to your doorstep',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewComponents extends StatelessWidget {
  PageViewComponents({
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
