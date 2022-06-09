import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:campost/views/shared/shared_exports.dart';
import 'package:get/get.dart';

import '../introduction/introduction.dart';

class SavingProcessView extends StatelessWidget {
  static const routeName = '/savingProcess';
  const SavingProcessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            SharedConstants.oopsAndOnboardingBackground,
            fit: BoxFit.fitWidth,
          ),
          ScreenPadding(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VerticalSpace(40.h),
                    DelayedDisplay(
                        slidingBeginOffset: Offset(1, 0),
                        child: Image.asset(
                            'assets/images/saving_process_background.png')),
                    VerticalSpace(50.h),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 200),
                      child: Text(
                        'Saving process',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      child: CustomTile(
                        iconName: 'assets/icons/schedule.png',
                        text:
                            'I open my ambition digital savings account in 5 minutes',
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 600),
                      child: CustomTile(
                        iconName: 'assets/icons/savings.png',
                        text:
                            'I choose the savings program that suits me, I can save from 100f CFA',
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 800),
                      child: CustomTile(
                        iconHeight: 16,
                        iconName: 'assets/icons/payments.png',
                        text:
                            'I make my deposits at my own pace, by mobile money, in cash, by bank card (special diaspora)',
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 1000),
                      child: CustomTile(
                        iconHeight: 16,
                        iconName: 'assets/icons/credit_card.png',
                        text:
                            'My money earns interest, I disburse when I want in case of emergency, or I wait for the right moment to disburse and finance my needs',
                      ),
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 1200),
                      child: CustomTile(
                        iconName: 'assets/icons/stabilization_lock.png',
                        text:
                            'My money is exclusively guaranteed by Cameroonian public treasury securities acquired by CAMPOST, my savings are totally secure',
                      ),
                    ),
                    VerticalSpace(30.h),
                    DelayedDisplay(
                      delay: Duration(
                        milliseconds: 1200,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text("Let's Start"),
                          onPressed: () {
                            Get.toNamed(Introduction.routeName);
                          },
                        ),
                      ),
                    ),
                    VerticalSpace(20.h)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String text;
  final String iconName;
  final double iconHeight;
  const CustomTile({
    Key? key,
    required this.text,
    required this.iconName,
    this.iconHeight = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 253, 240, 1),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(244, 242, 242, 1)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              iconName,
              height: iconHeight,
            ),
          ),
          HorizontalSpace(8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
