// ignore_for_file: must_be_immutable

import 'package:campost/views/shared/widgets/back_to_previous_screen.dart';
import 'package:campost/views/shared/widgets/lines_background.dart';
import 'package:campost/views/shared/widgets/screen_padding.dart';
import 'package:campost/views/shared/widgets/spaces.dart';
import 'package:campost/views/shared/widgets/card_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawView extends StatelessWidget {
  static const routeName = '/withdraw';
  WithdrawView({Key? key}) : super(key: key);
  var swithvalue = false.obs;

  var choiceButtonData = [
    ChoiceButtons(isSelected: false, text: '\$10'),
    ChoiceButtons(isSelected: false, text: '\$50'),
    ChoiceButtons(isSelected: false, text: '\$100'),
    ChoiceButtons(isSelected: false, text: '\$250'),
    ChoiceButtons(isSelected: false, text: '\$300'),
    ChoiceButtons(isSelected: false, text: 'other'),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinesBackground(
        flip: true,
        child: SafeArea(
          child: SizedBox.expand(
            child: ScreenPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BackToPreviousScreen(),
                      Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 40.w,
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          VerticalSpace(34.h),
                          Container(
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose your account',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.black),
                                ),
                                VerticalSpace(20.h),
                                WithdrawCard(),
                                Divider(
                                  height: 50.w,
                                ),
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.black),
                                ),
                                VerticalSpace(20.h),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  margin: EdgeInsets.only(right: 15.w),
                                  height: 180.h,
                                  constraints: BoxConstraints(
                                    maxHeight: 200,
                                    maxWidth: 300,
                                    minHeight: 100,
                                    minWidth: 200,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffe0d400),
                                        Color(0xfff2b700),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      13.r,
                                    ),
                                  ),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CustomPaint(
                                        painter: CustomMoneyCard(colors: [
                                          Color(0xfff2b700),
                                          Color(0xffe0d400),
                                        ]),
                                      ),
                                      Positioned(
                                        top: 20.h,
                                        left: 20.w,
                                        child: Image.asset(
                                          'assets/images/mtn.png',
                                          width: 60,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 20.w,
                                        right: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '00237 789 909 875',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Switch(
                                                    value: false,
                                                    onChanged: (value) {}),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.w,
                                                      vertical: 4.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.r),
                                                    color: Colors.black
                                                        .withOpacity(.5),
                                                    backgroundBlendMode:
                                                        BlendMode.overlay,
                                                  ),
                                                  child: Text(
                                                    '550.979 XAF',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 50.w,
                                ),
                                Text(
                                  'Choose Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.black),
                                ),
                                VerticalSpace(20.h),
                                Obx(
                                  () => Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List.generate(
                                      choiceButtonData.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          for (var element
                                              in choiceButtonData) {
                                            element.isSelected = false;
                                          }
                                          choiceButtonData[index].isSelected =
                                              true;
                                          choiceButtonData.refresh();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 42.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: choiceButtonData[index]
                                                    .isSelected
                                                ? Color(0xffffd300)
                                                : Color(0xffefeff4),
                                          ),
                                          child: Text(
                                            choiceButtonData[index].text,
                                            style: TextStyle(
                                                color: choiceButtonData[index]
                                                        .isSelected
                                                    ? Colors.black
                                                    : Colors.grey,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalSpace(20.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text('submont'),
                              onPressed: () {},
                            ),
                          ),
                          VerticalSpace(20.h)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WithdrawCard extends StatelessWidget {
  const WithdrawCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      height: 138.h,
      constraints: BoxConstraints(
        maxHeight: 150,
        maxWidth: 300,
        minHeight: 100,
        minWidth: 200,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff0087ff),
          Color(0xff0028ff),
        ]),
        borderRadius: BorderRadius.circular(
          13.r,
        ),
      ),
      child: Stack(
        children: [
          Opacity(
              opacity: .3, child: Image.asset('assets/images/cardline1.png')),
          Opacity(
            opacity: .3,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/cardline2.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Blocked Saving',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp),
                ),
                Spacer(),
                Text(
                  'Current Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
                VerticalSpace(4.h),
                Text(
                  '\$1200.49',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButtons {
  final String text;
  bool isSelected;
  ChoiceButtons({
    required this.text,
    required this.isSelected,
  });
}
