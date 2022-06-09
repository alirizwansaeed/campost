// ignore_for_file: must_be_immutable

import 'package:campost/views/create_account/create_account_constants.dart';
import 'package:campost/views/onboarding_summary/summary_sheet.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountView extends StatelessWidget {
  static const routeName = '/create_account';
  CreateAccountView({Key? key}) : super(key: key);
  var _isclasicSaving = false.obs;
  var _isBlockedSaving = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
            child: SizedBox.expand(
          child: ScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackToPreviousScreen(),
                    Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                      ),
                    ),
                    HorizontalSpace(40.w)
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        VerticalSpace(40.h),
                        Text(
                          'Please Select Your Account Type',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                          ),
                        ),
                        VerticalSpace(30.h),
                        GestureDetector(
                          onTap: () {
                            _isclasicSaving(true);
                            _isBlockedSaving(false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 35.h, horizontal: 30.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      CreateAccountConstants.readingGirl,
                                      height: 200.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: _isclasicSaving.value
                                              ? Color(0xffffd300)
                                              : Color(0xfffff1ab),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: _isclasicSaving.value
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalSpace(10.h),
                                Text(
                                  'Classic saving',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                VerticalSpace(10.h),
                                Text(
                                  CreateAccountConstants
                                      .openASecureSavingAccount,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalSpace(30.h),
                        GestureDetector(
                          onTap: () {
                            _isclasicSaving(false);
                            _isBlockedSaving(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 35.h, horizontal: 30.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      CreateAccountConstants.moneyGirl,
                                      height: 200.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: _isBlockedSaving.value
                                              ? Color(0xffffd300)
                                              : Color(0xfffff1ab),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: _isBlockedSaving.value
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalSpace(10.h),
                                Text(
                                  'Blocked Savings',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                VerticalSpace(10.h),
                                Text(
                                  CreateAccountConstants
                                      .openASecureBlockedAccount,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalSpace(25.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: _isclasicSaving.value ||
                                      _isBlockedSaving.value
                                  ? () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        constraints: BoxConstraints(
                                            maxHeight: Get.height -
                                                Get.mediaQuery.padding.top),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        builder: (context) => Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: SingleChildScrollView(
                                              child: SummarySheet()),
                                        ),
                                      );
                                    }
                                  : null,
                              child: Text('Next')),
                        ),
                        VerticalSpace(20.h)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
