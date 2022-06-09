import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';

class SubmitSignatureSheet extends StatelessWidget {
  const SubmitSignatureSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalSpace(31.h),
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Singnature',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffffe9eb), shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                )
              ],
            ),
          ),
          VerticalSpace(20.h),
          Text(
            'Please sign in the area and confirm to account terms and condition',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          VerticalSpace(20.h),
          FormBuilderSignaturePad(
            height: 300.h,
            name: 'signaturepad',
            backgroundColor: Colors.white,
            decoration: InputDecoration(),
          ),
          VerticalSpace(33.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(CreateAccountView.routeName);
              },
              child: Text('Submit Signature'),
            ),
          ),
          VerticalSpace(20.h)
        ],
      ),
    );
  }
}
