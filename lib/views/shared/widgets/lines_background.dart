import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../shared_exports.dart';

class LinesBackground extends StatelessWidget {
  final Widget child;
  final bool flip;
  const LinesBackground({
    Key? key,
    required this.child,
    this.flip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flip
        ? Stack(
            fit: StackFit.expand,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Color(0xFFFAF8ED).withOpacity(.3), BlendMode.dstATop),
                      image: AssetImage(
                        SharedConstants.linesBackground,
                      ),
                    ),
                  ),
                ),
              ),
              child,
            ],
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Color(0xFFFAF8ED).withOpacity(.3), BlendMode.dstATop),
                image: AssetImage(
                  SharedConstants.linesBackground,
                ),
              ),
            ),
            child: child,
          );
  }
}
