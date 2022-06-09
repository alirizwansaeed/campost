import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BackToPreviousScreen extends StatelessWidget {
  final Color color;
  final Color filledColor;
  const BackToPreviousScreen({
    Key? key,
    this.color = Colors.black,
    this.filledColor = const Color(0xFFE3E1D7),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            color: filledColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          height: 40.r,
          width: 40.r,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: color,
          ),
        ),
      ),
    );
  }
}
