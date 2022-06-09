import 'package:campost/views/mobile_money_create_form/mobile_money_sheet.dart';
import 'package:flutter/material.dart';

class MobileMoneyCreateFormView extends StatelessWidget {
  static const routeName = '/mobile_money_create_form';
  const MobileMoneyCreateFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {}, child: Text('Show form')),
      ),
    );
  }
}
