import 'package:campost/views/account_process/account_process_constants.dart';
import 'package:campost/views/shared/widgets/back_to_previous_screen.dart';
import 'package:campost/views/shared/widgets/lines_background.dart';
import 'package:campost/views/shared/widgets/screen_padding.dart';
import 'package:campost/views/shared/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountProcessView extends StatelessWidget {
  static const routeName = '/account_process';
  const AccountProcessView({Key? key}) : super(key: key);

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
                    children: [
                      BackToPreviousScreen(),
                      Text(
                        'Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 40.r,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        VerticalSpace(21.h),
                        ListTile(
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text('Blocked Savings'),
                          subtitle: Text('4731 2234 ****'),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                          leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff323232)),
                              child: Image.asset(
                                AccountProcessConstants.keyIcon,
                                width: 20,
                              )),
                          tileColor: Color(0xffefeff4),
                        ),
                        VerticalSpace(21.h),
                        Text(
                          'Select The Start Month / Year',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400),
                        ),
                        VerticalSpace(6.h),
                        Row(
                          children: [
                            Expanded(
                              child: FormBuilderDateTimePicker(
                                inputType: InputType.date,
                                name: AccountProcessConstants.startDate,
                                decoration:
                                    InputDecoration(hintText: 'Start Date'),
                              ),
                            )
                          ],
                        ),
                        VerticalSpace(20.h),
                        Text(
                          'Select The End Month / Year',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400),
                        ),
                        VerticalSpace(6.h),
                        Row(
                          children: [
                            Expanded(
                              child: FormBuilderDateTimePicker(
                                inputType: InputType.date,
                                name: AccountProcessConstants.endDate,
                                decoration:
                                    InputDecoration(hintText: 'End Date'),
                              ),
                            )
                          ],
                        ),
                        VerticalSpace(20.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Duration',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.w, vertical: 9.h),
                                decoration:
                                    BoxDecoration(color: Color(0xfff1f1fd)),
                                child: Text(
                                  '10 Month',
                                  style: TextStyle(
                                    color: Color(0xff001bff),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace(20.h),
                        Text(
                          'Interest Rate',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400),
                        ),
                        VerticalSpace(12.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xffffd300),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '15%',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                        VerticalSpace(23.h),
                        Text(
                          'Type Your Amount',
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400),
                        ),
                        VerticalSpace(12.h),
                        FormBuilderTextField(
                          name: AccountProcessConstants.typeAmount,
                          decoration: InputDecoration(
                              prefix: Text(
                            '\$',
                            style: TextStyle(
                                color: Color(0xff001bff),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          )),
                          style: TextStyle(
                            color: Color(0xff001bff),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        VerticalSpace(20.h),
                        FormBuilderCheckbox(
                          name: AccountProcessConstants.confirmSubscription,
                          title: Text(
                            'Confirm the subscription',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        VerticalSpace(20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Submit')),
                        ),
                        VerticalSpace(20.h)
                      ],
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
