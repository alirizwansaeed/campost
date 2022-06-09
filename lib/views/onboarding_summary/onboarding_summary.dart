import 'package:campost/views/onboarding_summary/summary_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingSummaryView extends StatelessWidget {
  static const routeName = '/onboarding_summary';
  const OnboardingSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {}, child: Text('summary sheet')),
      ),
    );
  }
}
