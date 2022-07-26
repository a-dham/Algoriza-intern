import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:task_1/core/custom_elevated_button.dart';
import 'package:task_1/core/utils/constant.dart';
import 'widgets/page_view_components.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5.h, right: 4.w, left: 4.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: pageController!.hasClients
                    ? pageController!.page == 2
                        ? false
                        : true
                    : true,
                replacement: const SizedBox(
                  height: 48,
                ),
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                      context,
                      login,
                    );
                  },
                  verticalPadding: 10,
                  text: 'Skip',
                  textColor: Colors.black,
                  buttonColor: Colors.amber.withOpacity(0.2),
                  circular: 15,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '7',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Krave',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: const Color(0xff263238),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: PageView(
                controller: pageController,
                reverse: false,
                allowImplicitScrolling: true,
                children: const [
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
            ),
            DotsIndicator(
              dotsCount: 3,
              position: pageController!.hasClients ? pageController!.page! : 0,
              decorator: const DotsDecorator(
                shape: Border(),
                activeColor: Color(0xff263238),
                size: Size(15, 5),
                activeShape: Border(),
                activeSize: Size(15, 5),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (pageController!.hasClients &&
                          pageController!.page == 2) {
                        Navigator.popAndPushNamed(
                          context,
                          login,
                        );
                      } else {
                        pageController!.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    verticalPadding: 23,
                    text: pageController!.hasClients
                        ? pageController!.page == 2
                            ? 'Get Started'
                            : 'Next'
                        : 'next',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff263238),
                    circular: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Align(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        onEnter: (value) {},
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.popAndPushNamed(
                              context,
                              signUp,
                            );
                          },
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Color(0xff263238),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
