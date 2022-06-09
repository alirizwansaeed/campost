import 'package:campost/views/saving_process/saving_process.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/splash/splash_constants.dart';
import 'package:campost/views/views_exports.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  static const routeName = '/splash';
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _sizeAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.4), weight: 70),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 1.0), weight: 30),
    ]).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(SplashConstants.backgroundImage))),
        child: SizedBox.expand(
          child: ScreenPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform.scale(
                    scale: _sizeAnimation.value,
                    child: Image.asset(
                      SharedConstants.logo,
                      width: 300.w,
                      height: 300.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1000),
                  slidingBeginOffset: Offset(.35, 0),
                  child: Text(
                    SplashConstants.easyBanking,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp,
                        color: Color(0xFF323232)),
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1500),
                  slidingBeginOffset: Offset(-.35, 0),
                  child: Column(
                    children: [
                      Text(
                        SplashConstants.ConnectYourMoney,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xFF323232)),
                      ),
                      Text(
                        SplashConstants.familyAndExperence,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xFF323232)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 2000),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(SavingProcessView.routeName);
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
