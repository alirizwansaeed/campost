import 'package:campost/views/mobile_number/mobile_number_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:get/get.dart';

class MobileNumberView extends StatelessWidget {
  static const routeName = '/mobile_number';
  const MobileNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: LinesBackground(
          flip: true,
          child: SafeArea(
            child: ScreenPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  VerticalSpace(15.h),
                  BackToPreviousScreen(),
                  VerticalSpace(60.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 000),
                    slidingBeginOffset: Offset(1, 0),
                    child: Text(
                      MobileNumberConstants.mobileNumber,
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 300),
                    slidingBeginOffset: Offset(1, 0),
                    child: Text(
                      MobileNumberConstants.pleaseEnter,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  VerticalSpace(42.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 600),
                    slidingBeginOffset: Offset(1, 0),
                    child: FormBuilderPhoneField(
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile Number',
                      ),
                      name: MobileNumberConstants.mobileNumber,
                    ),
                  ),
                  VerticalSpace(41.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 900),
                    slidingBeginOffset: Offset(1, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(VerifyMobileNumberView.routeName);
                        },
                        child: Text('Send Code'),
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
