import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TransactionSheet extends StatefulWidget {
  const TransactionSheet({Key? key}) : super(key: key);

  @override
  _TransactionSheetState createState() => _TransactionSheetState();
}

class _TransactionSheetState extends State<TransactionSheet> {
  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalSpace(15.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffffe9eb), shape: BoxShape.circle),
              child: IconButton(
                splashRadius: 2,
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              ),
            ),
          ),
          VerticalSpace(22.h),
          Text(
            'Confirm Your Pin Code',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            'Once confirmed, your transaction will be complete.',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
          VerticalSpace(27.h),
          PinCodeTextField(
            keyboardType: TextInputType.visiblePassword,
            appContext: context,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            obscureText: true,
            blinkWhenObscuring: true,
            hintCharacter: '-',
            obscuringWidget: Text(
              '●',
              style: TextStyle(color: Color(0xFF001AFF), fontSize: 25.sp),
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
          VerticalSpace(30.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(IdTypeView.routeName);
                },
                child: Text('Submit')),
          ),
          VerticalSpace(20.h)
        ],
      ),
    );
  }
}
