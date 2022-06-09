import 'package:campost/views/onboarding_summary/onboarding_summary_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:get/get.dart';

class SummarySheet extends StatelessWidget {
  const SummarySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Text(
            'We Are Currently Validating Your ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                'Account Opening Request',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              HorizontalSpace(8.w),
              Image.asset(
                OnboardingSummaryConstants.warningIcon,
                width: 20,
              ),
            ],
          ),
          VerticalSpace(17.h),
          FormBuilderPhoneField(
            name: OnboardingSummaryConstants.phoneNumber,
            decoration: InputDecoration(hintText: 'Phone Number'),
          ),
          VerticalSpace(15.h),
          FormBuilderTextField(
            name: OnboardingSummaryConstants.firstName,
            decoration: InputDecoration(hintText: 'First Name'),
          ),
          VerticalSpace(15.h),
          FormBuilderTextField(
            name: OnboardingSummaryConstants.lastName,
            decoration: InputDecoration(hintText: 'Last Name'),
          ),
          VerticalSpace(15.h),
          FormBuilderDateTimePicker(
            name: OnboardingSummaryConstants.dateOfBirth,
            inputType: InputType.date,
            decoration: InputDecoration(hintText: 'Birth Date'),
          ),
          VerticalSpace(15.h),
          FormBuilderTextField(
            name: OnboardingSummaryConstants.address,
            decoration: InputDecoration(hintText: 'Address'),
          ),
          VerticalSpace(35.h),
          Text(
            'Type Of Account(s) To Open',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          Card(
            child: FormBuilderCheckbox(
              name: 'classic saving',
              title: Text('classic saving'),
            ),
          ),
          Card(
            child: FormBuilderCheckbox(
              name: 'blocked saving',
              title: Text('Blocked saving'),
            ),
          ),
          VerticalSpace(31.h),
          Text(
            'Please Sign In The Area And Confirm To Account Terms And Condition',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          VerticalSpace(22.h),
          FormBuilderSignaturePad(
            name: 'signaturepad',
            decoration:
                InputDecoration(filled: true, fillColor: Color(0xffffd200)),
            backgroundColor: Color(0xffffd200),
          ),
          VerticalSpace(35.h),
          Text(
            'Additional Documents Needed For Your Account Opening',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          VerticalSpace(35.h),
          Text(
            'Please Provide Some Documents',
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          VerticalSpace(10.h),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'A copy of proof of address',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff001bff)),
                      ),
                      Icon(
                        Icons.check,
                        color: Color(0xff001bff),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'A copy of a second ID document (National ID or Passport)',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffaeadae)),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xffaeadae),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VerticalSpace(25.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(LoginView.routeName);
                },
                child: Text('Done')),
          ),
          VerticalSpace(20.h)
        ],
      ),
    );
  }
}
