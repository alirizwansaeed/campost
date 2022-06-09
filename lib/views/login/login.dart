import 'package:campost/views/login/login_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: .4.sh,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      SharedConstants.idAndLoginBackground,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      SharedConstants.logo,
                      height: 200.h,
                      width: 300.w,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Hello there, log in to continue',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            VerticalSpace(33.h),
            ScreenPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  VerticalSpace(11.h),
                  FormBuilderPhoneField(name: LoginConstants.phoneNumber),
                  VerticalSpace(17.h),
                  Text(
                    'Pin Code',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  VerticalSpace(11.h),
                  PinCodeTextField(
                    keyboardType: TextInputType.visiblePassword,
                    appContext: context,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    hintCharacter: '-',
                    obscuringWidget: Text(
                      '●',
                      style:
                          TextStyle(color: Color(0xFF001AFF), fontSize: 25.sp),
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
                  VerticalSpace(33.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(HomePageView.routeName);
                        },
                        child: Text('Log in')),
                  ),
                  VerticalSpace(15.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffffd300), onPrimary: Colors.black),
                      onPressed: () {
                        Get.toNamed(VideoRecordView.routeName, arguments: true);
                      },
                      child: Text('Log In with face screen'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
