import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/submit_signature/submit_signature_sheet.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyMobileNumberView extends StatelessWidget {
  static const routeName = '/verify_mobile_number';
  const VerifyMobileNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: LinesBackground(
            child: SafeArea(
                child: ScreenPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(15.h),
              BackToPreviousScreen(),
              VerticalSpace(60.h),
              DelayedDisplay(
                delay: const Duration(milliseconds: 00),
                slidingBeginOffset: Offset(1, 0),
                child: Text(
                  'Verification',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                ),
              ),
              DelayedDisplay(
                delay: const Duration(milliseconds: 300),
                slidingBeginOffset: Offset(1, 0),
                child: Text(
                  'Enter 5 digit code we sent to (number)',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              ),
              VerticalSpace(40.h),
              DelayedDisplay(
                delay: const Duration(milliseconds: 600),
                slidingBeginOffset: Offset(1, 0),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 5,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinTheme: PinTheme(
                    fieldWidth: 50.r,
                    fieldHeight: 50.r,
                    borderWidth: 1.5,
                    selectedColor: Color(0xFFFED500),
                    activeColor: Color(0xFF001AFF),
                    borderRadius: BorderRadius.circular(15.r),
                    inactiveColor: Color(0xFFAEAEAE),
                    shape: PinCodeFieldShape.box,
                  ),
                  onChanged: (value) {},
                ),
              ),
              VerticalSpace(20.h),
              DelayedDisplay(
                delay: const Duration(milliseconds: 900),
                slidingBeginOffset: Offset(1, 0),
                child: Text(
                  'Resend Code in 00:59',
                  style: TextStyle(
                    color: Color(0xFFFED710),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              VerticalSpace(40.h),
              DelayedDisplay(
                delay: const Duration(milliseconds: 1200),
                slidingBeginOffset: Offset(1, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (context) => SubmitSignatureSheet(),
                        );
                      },
                      child: Text('Verify Account')),
                ),
              )
            ],
          ),
        ))),
      ),
    );
  }
}
