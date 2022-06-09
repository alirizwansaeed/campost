import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/views_exports.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => SplashView());
                    },
                    child: Text('Splash screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => IdTypeView());
                    },
                    child: Text('Id Scan screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => VideoRecordView());
                    },
                    child: Text('Video Record screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => IdScanView());
                    },
                    child: Text('Id Type screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => PersonalDataView());
                    },
                    child: Text('Personal data Screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => MobileNumberView());
                    },
                    child: Text('Mobile number screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => VerifyMobileNumberView());
                    },
                    child: Text('Verify mobile number screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => PinCodeView());
                    },
                    child: Text('pincode screen')),
                TextButton(
                    onPressed: () {
                      Get.to(() => HomePageView());
                    },
                    child: Text('Home Page View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => WithdrawView());
                    },
                    child: Text('withdraw View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => MobileMoneyCreateFormView());
                    },
                    child: Text('Mobile money create form View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => AccountProcessView());
                    },
                    child: Text('Account process View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => AccountSetting());
                    },
                    child: Text('AccountSetting View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => LoginView());
                    },
                    child: Text('Login View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => CreateAccountView());
                    },
                    child: Text('Create account View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => OnboardingSummaryView());
                    },
                    child: Text('Onboarding summary View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => OopsView());
                    },
                    child: Text('Oops View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => Introduction());
                    },
                    child: Text('Introduction View')),
                TextButton(
                    onPressed: () {
                      Get.to(() => MobileMoneyView());
                    },
                    child: Text('Mobile Money View')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
