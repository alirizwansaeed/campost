import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/shared/widgets/card_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileMoneyView extends StatelessWidget {
  static const routeName = '/mobile_money';
  const MobileMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinesBackground(
      child: SafeArea(
        child: ScreenPadding(
          child: Column(
            children: [
              VerticalSpace(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    'Mobile Money',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                        color: Color(0xffe3e3e5),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  VerticalSpace(30.h),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Switch(value: false, onChanged: (value) {}),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.r),
                                      color: Colors.black.withOpacity(.5),
                                      backgroundBlendMode: BlendMode.overlay,
                                    ),
                                    child: Text(
                                      '550.979 XAF',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
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
                  VerticalSpace(28.h),
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
                          Color(0xffff7f24),
                          Color(0xffff0700),
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
                            Color(0xffff0700),
                            Color(0xffff7f24),
                          ]),
                        ),
                        Positioned(
                          top: 20.h,
                          left: 20.w,
                          child: Image.asset(
                            'assets/images/orange.png',
                            width: 60,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20.w,
                          right: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Switch(value: false, onChanged: (value) {}),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.r),
                                      color: Colors.black.withOpacity(.5),
                                      backgroundBlendMode: BlendMode.overlay,
                                    ),
                                    child: Text(
                                      '550.979 XAF',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
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
                  VerticalSpace(28.h),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.all(18),
                    height: 180.h,
                    constraints: BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 300,
                      minHeight: 100,
                      minWidth: 200,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/images/mask_debitcard.png')),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff0060c3),
                          Color(0xff325673),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                        13.r,
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            VerticalSpace(10.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Qognitiv',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  '****   ****   ****   8505',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                                Spacer(),
                                Text(
                                  'DEBT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            VerticalSpace(20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Card holder name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      VerticalSpace(3),
                                      Text(
                                        'Mr Author Monney',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Expiry Date',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      VerticalSpace(3),
                                      Text(
                                        '09/24',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/icons/debit_card_circles.png',
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
