import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double? height;

  const VerticalSpace(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double? width;

  const HorizontalSpace(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
