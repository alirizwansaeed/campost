import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/transaction_pincode/transaction_sheet.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeView extends StatelessWidget {
  static const routeName = '/pin_code';
  const PinCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: LinesBackground(
          flip: true,
          child: SafeArea(
            child: ScreenPadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(15.h),
                  BackToPreviousScreen(),
                  VerticalSpace(60.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 000),
                    slidingBeginOffset: Offset(1, 0),
                    child: Text(
                      'Add Pin code',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 200),
                    slidingBeginOffset: Offset(1, 0),
                    child: Text(
                      'Secure your login with pin code',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  VerticalSpace(40.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 400),
                    slidingBeginOffset: Offset(1, 0),
                    child: PinCodeTextField(
                      keyboardType: TextInputType.visiblePassword,
                      appContext: context,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      obscureText: true,
                      blinkWhenObscuring: true,
                      hintCharacter: '-',
                      obscuringWidget: Text(
                        '●',
                        style: TextStyle(
                            color: Color(0xFF001AFF), fontSize: 25.sp),
                      ),
                      length: 5,
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
                  VerticalSpace(40.h),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 600),
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
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: TransactionSheet(),
                              ),
                            );
                          },
                          child: Text('Add Pin')),
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
