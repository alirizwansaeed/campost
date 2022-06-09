import 'package:campost/views/oops/oops_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OopsView extends StatefulWidget {
  static const routeName = '/oops';
  const OopsView({Key? key}) : super(key: key);

  @override
  _OopsViewState createState() => _OopsViewState();
}

class _OopsViewState extends State<OopsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              SharedConstants.oopsAndOnboardingBackground,
              fit: BoxFit.fitWidth,
            ),
            SafeArea(
              child: ScreenPadding(
                child: Column(
                  children: [
                    VerticalSpace(30.h),
                    Image.asset(OopsConstants.oopsImage),
                    VerticalSpace(50.h),
                    Text(
                      'Slow or no internet connection. Check your internet settings.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    VerticalSpace(50.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(LoginView.routeName);
                          },
                          child: Text('Try Again')),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
