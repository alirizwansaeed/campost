import 'package:campost/views/personal_data/personal_data_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:country_picker/country_picker.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../views_exports.dart';

class PersonalDataView extends StatefulWidget {
  static const routeName = '/personal_data';
  PersonalDataView({Key? key}) : super(key: key);

  @override
  State<PersonalDataView> createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: SizedBox.expand(
          child: LinesBackground(
            child: SafeArea(
              child: ScreenPadding(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(15.h),
                      BackToPreviousScreen(),
                      VerticalSpace(50.h),
                      Row(
                        children: [
                          Expanded(
                            child: DelayedDisplay(
                              slidingBeginOffset: Offset(-.35, 0),
                              child: FormBuilderTextField(
                                name: PersonalDataConstants.firstName,
                                decoration: InputDecoration(
                                    hintText: PersonalDataConstants.firstName),
                              ),
                            ),
                          ),
                          HorizontalSpace(14.w),
                          Expanded(
                            child: DelayedDisplay(
                              slidingBeginOffset: Offset(.35, 0),
                              child: FormBuilderTextField(
                                name: PersonalDataConstants.lastName,
                                decoration: InputDecoration(
                                    hintText: PersonalDataConstants.lastName),
                              ),
                            ),
                          ),
                        ],
                      ),
                      VerticalSpace(25.h),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 300),
                        child: FormBuilderTextField(
                          name: PersonalDataConstants.country,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: 'Select Country',
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
                                    ?.fields[PersonalDataConstants.country]
                                    ?.didChange(country.name);
                              },
                            );
                          },
                        ),
                      ),
                      VerticalSpace(25.h),
                      Row(
                        children: [
                          Expanded(
                            child: DelayedDisplay(
                              delay: const Duration(milliseconds: 600),
                              slidingBeginOffset: Offset(-.35, 0),
                              child: FormBuilderDropdown(
                                hint: Text(
                                  'Gender',
                                  style: TextStyle(color: Color(0xFFAEAEAE)),
                                ),
                                name: PersonalDataConstants.gender,
                                items: [
                                  DropdownMenuItem(
                                      value: 'Male', child: Text('Male')),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text('Female'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          HorizontalSpace(14.w),
                          Expanded(
                            child: DelayedDisplay(
                              delay: const Duration(milliseconds: 600),
                              slidingBeginOffset: Offset(.35, 0),
                              child: FormBuilderDateTimePicker(
                                inputType: InputType.date,
                                name: PersonalDataConstants.dateOfBirth,
                                decoration: InputDecoration(
                                  hintText: "Birth Date",
                                  suffixIcon: Icon(
                                    Icons.date_range,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      VerticalSpace(25.h),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 900),
                        child: FormBuilderTextField(
                          name: PersonalDataConstants.addressLine,
                          decoration: InputDecoration(
                              hintText: PersonalDataConstants.addressLine),
                        ),
                      ),
                      VerticalSpace(25.h),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 1200),
                        child: FormBuilderTextField(
                          name: PersonalDataConstants.postalCode,
                          validator: FormBuilderValidators.required(context),
                          decoration: InputDecoration(
                              hintText: PersonalDataConstants.postalCode),
                        ),
                      ),
                      VerticalSpace(25.h),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 1500),
                        child: FormBuilderTextField(
                          name: PersonalDataConstants.countryOfResidence,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText:
                                  PersonalDataConstants.countryOfResidence,
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
                                _formKey.currentState?.fields['name']
                                    ?.didChange(country.name);
                              },
                            );
                          },
                        ),
                      ),
                      VerticalSpace(25.h),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 1800),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFAF6E3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.place,
                                color: Color(0xFFFED500),
                              ),
                            ),
                            HorizontalSpace(10.w),
                            Text(
                              PersonalDataConstants.useLocation,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFED500),
                              ),
                            )
                          ],
                        ),
                      ),
                      VerticalSpace(25.h),
                      SizedBox(
                        width: double.infinity,
                        child: DelayedDisplay(
                          slidingBeginOffset: Offset(0, -1),
                          delay: const Duration(milliseconds: 2000),
                          slidingCurve: Curves.bounceOut,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(VideoRecordView.routeName,
                                  arguments: false);
                            },
                            child: Text('Done'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
