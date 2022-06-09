import 'package:campost/views/introduction/introduction_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Introduction extends StatelessWidget {
  static const routeName = '/introduction';
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: true,
      showSkipButton: true,
      onSkip: () {
        Get.toNamed(PinCodeView.routeName);
      },
      done: Icon(Icons.done),
      skipColor: Colors.black,
      dotsDecorator: DotsDecorator(
          activeColor: Color(0xffffd300),
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Color(0xffffd300), width: 2)),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      skip: Text(
        'Skip',
        style: TextStyle(color: Colors.black),
      ),
      nextColor: Colors.black,
      next: Icon(Icons.arrow_forward),
      onDone: () {
        Get.toNamed(PinCodeView.routeName);
      },
      rawPages: [
        Stack(
          children: [
            Image.asset(
              SharedConstants.oopsAndOnboardingBackground,
              fit: BoxFit.fitWidth,
            ),
            SafeArea(
              child: ScreenPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IntroductionConstants.firstImage),
                    Text(
                      'CAMPOST Reinvents Itself, Discovers CAMPOSTCONNECT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(20.h),
                    Text(
                      'A 100% digital, reformed and civic-minded financial services platform!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Image.asset(
              SharedConstants.oopsAndOnboardingBackground,
              fit: BoxFit.fitWidth,
            ),
            SafeArea(
              child: ScreenPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IntroductionConstants.secondImage),
                    Text(
                      'CAMPOST CONNECT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(20.h),
                    Text(
                      'Revolutionizes savings for all, regardless of the amount!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Image.asset(
              SharedConstants.oopsAndOnboardingBackground,
              fit: BoxFit.fitWidth,
            ),
            SafeArea(
              child: ScreenPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IntroductionConstants.thirdImage),
                    Text(
                      'Easy Account Opening! In 3 Easy Steps',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                    VerticalSpace(30.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '1. I scan my ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '2. I validate my mobile phone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "3. I choose the savings program that's right for me",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
