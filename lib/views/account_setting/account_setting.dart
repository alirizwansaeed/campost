import 'package:campost/views/account_setting/account_setting_constants.dart';
import 'package:campost/views/shared/widgets/back_to_previous_screen.dart';
import 'package:campost/views/shared/widgets/lines_background.dart';
import 'package:campost/views/shared/widgets/screen_padding.dart';
import 'package:campost/views/shared/widgets/spaces.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AccountSetting extends StatelessWidget {
  static const routeName = '/account_setting';
  AccountSetting({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinesBackground(
        child: SafeArea(
          child: SizedBox.expand(
            child: ScreenPadding(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(15.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackToPreviousScreen(),
                        Text(
                          'settings',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 40.w,
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          VerticalSpace(30.h),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'First Name',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    VerticalSpace(10.h),
                                    FormBuilderTextField(
                                      name: AccountSettingConstants.firstName,
                                    )
                                  ],
                                ),
                              ),
                              HorizontalSpace(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'last Name',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    VerticalSpace(10.h),
                                    FormBuilderTextField(
                                      name: AccountSettingConstants.lastName,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          VerticalSpace(17.h),
                          Text(
                            'Country',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          VerticalSpace(11.h),
                          FormBuilderTextField(
                            name: AccountSettingConstants.country,
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.expand_more)),
                            validator: FormBuilderValidators.required(context),
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: Colors.white,
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.blueGrey),
                                  //Optional. Sets the border radius for the bottomsheet.
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  //Optional. Styles the search field.
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) {
                                  _formKey.currentState
                                      ?.fields[AccountSettingConstants.country]
                                      ?.didChange(country.name);
                                },
                              );
                            },
                          ),
                          VerticalSpace(17.h),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sex',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    VerticalSpace(10.h),
                                    FormBuilderDropdown(
                                      items: [
                                        DropdownMenuItem(
                                            value: 'male', child: Text('Male')),
                                        DropdownMenuItem(
                                            value: 'female',
                                            child: Text('Female')),
                                      ],
                                      name: AccountSettingConstants.sex,
                                    )
                                  ],
                                ),
                              ),
                              HorizontalSpace(10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'last Name',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    VerticalSpace(10.h),
                                    FormBuilderDateTimePicker(
                                      name: AccountSettingConstants.dateOfBirth,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          VerticalSpace(17.h),
                          Text(
                            'Last Name',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          VerticalSpace(11.h),
                          FormBuilderTextField(
                            name: AccountSettingConstants.pincode,
                            obscureText: true,
                          ),
                          VerticalSpace(17.h),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          VerticalSpace(11.h),
                          FormBuilderPhoneField(
                              name: AccountSettingConstants.phoneNumber),
                          VerticalSpace(20.h),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.expand_more,
                                        color: Colors.grey,
                                      ),
                                      HorizontalSpace(10.w),
                                      Text(
                                        'Account Verification',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Please Upload National ID',
                                        style: TextStyle(
                                            color: Color(0xff001bff),
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff001bff),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalSpace(17.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, bottom: 15.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Foreign passport',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Submitted',
                                        style: TextStyle(
                                          color: Color(0xffffd300),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          VerticalSpace(30.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Save'),
                            ),
                          ),
                          VerticalSpace(25.h)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
