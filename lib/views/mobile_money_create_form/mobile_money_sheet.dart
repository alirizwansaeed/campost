import 'package:campost/views/mobile_money_create_form/mobile_money_create_form_constants.dart';
import 'package:campost/views/shared/widgets/screen_padding.dart';
import 'package:campost/views/shared/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MobileMoneySheet extends StatelessWidget {
  const MobileMoneySheet({
    Key? key,
  }) : super(key: key);

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
          VerticalSpace(14.h),
          Text(
            'Create The Form',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: MobileMoneyCreateFormConstants.firstName,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: MobileMoneyCreateFormConstants.lastName,
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
              ),
            ],
          ),
          VerticalSpace(20.h),
          FormBuilderTextField(
            name: MobileMoneyCreateFormConstants.emailaddress,
            decoration: InputDecoration(hintText: 'Email Address'),
          ),
          VerticalSpace(20.h),
          FormBuilderTextField(
            name: MobileMoneyCreateFormConstants.phoneNumber,
            decoration: InputDecoration(hintText: 'Phone Number'),
          ),
          VerticalSpace(20.h),
          FormBuilderTextField(
            name: MobileMoneyCreateFormConstants.companyName,
            decoration: InputDecoration(hintText: 'Company Name'),
          ),
          VerticalSpace(35.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Add New Card'),
              onPressed: () {},
            ),
          ),
          VerticalSpace(20.h)
        ],
      ),
    );
  }
}
