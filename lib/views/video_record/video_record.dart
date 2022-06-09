// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:campost/main.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/video_record/widgets/wave_animation.dart';
import 'package:campost/views/views_exports.dart';

class VideoRecordView extends StatefulWidget {
  static const routeName = '/video_record_2';
  VideoRecordView({
    Key? key,
  }) : super(key: key);
  final bool isloggedin = Get.arguments as bool;
  @override
  State<VideoRecordView> createState() => _VideoRecordPageState();
}

class _VideoRecordPageState extends State<VideoRecordView>
    with TickerProviderStateMixin {
  CameraController? _cameraController;
//this animation is user for timer value from 1 to 10
  late AnimationController _timerAnimationController;
//this animation used for oval shape
  late AnimationController _waveAnimationController;
  //this animation is used for scaling the timer widget
  late AnimationController _scaleAnimationController;

  late Animation<Alignment> _alignmentTween;

  var _isStartButton = true.obs;
  var _isloggedIn = false.obs;

  @override
  void initState() {
    _isloggedIn(widget.isloggedin);
    super.initState();
    animationInitilization();
    cameraInitilization();
  }

  void cameraInitilization() {
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    _cameraController?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void animationInitilization() {
    _scaleAnimationController = AnimationController(
        vsync: this,
        lowerBound: 1,
        upperBound: 1.2,
        duration: Duration(milliseconds: 200),
        reverseDuration: Duration(milliseconds: 200));
    _timerAnimationController = AnimationController(
      lowerBound: 0,
      upperBound: 5,
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _waveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );

    _alignmentTween =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .animate(
      CurvedAnimation(
        parent: _waveAnimationController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      ),
    );
    //repeat wave animaiton
    _waveAnimationController.repeat(reverse: true);
    animationListners();
  }

  void animationListners() {
    _scaleAnimationController.addListener(() {
      setState(() {});
    });
    _timerAnimationController.addListener(() {
      setState(() {});
    });
    _waveAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _waveAnimationController.dispose();
    _timerAnimationController.dispose();
    _scaleAnimationController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

//here you can write the code for when you tap the button
  void onPanStart() async {
    await _timerAnimationController.forward();
    _isloggedIn.value
        ? Get.toNamed(
            HomePageView.routeName,
          )
        : Get.toNamed(MobileNumberView.routeName);
    // await  _scaleAnimationController.forward();
  }

//here you write the code when you left finger from button
  void onPanEnd() {
    _timerAnimationController.reset();
    _scaleAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_cameraController!.value.isInitialized
          ? Container()
          : SizedBox.expand(
              child: CameraPreview(
                _cameraController!,
                child: Obx(
                  () => Stack(
                    children: [
                      BlackMaskWithOvalShape(),
                      WaveAnimaitonOnOvalShape(alignmentTween: _alignmentTween),
                      DelayedDisplay(
                        slidingBeginOffset: const Offset(0.0, 1),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: _isStartButton.value
                                ? () {
                                    _isStartButton.toggle();
                                  }
                                : onPanStart,
                            // onPanStart: _isStartButton.value
                            //     ? null
                            //     : (details) => onPanStart(),
                            // onPanEnd: _isStartButton.value
                            //     ? null
                            //     : (details) => onPanEnd(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _isStartButton.value
                                    ? Container(
                                        height: 70.r,
                                        width: 70.r,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Start',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Transform.scale(
                                        scale: _scaleAnimationController.value,
                                        child: CircularPercentIndicator(
                                          radius: 70.r,
                                          percent:
                                              _timerAnimationController.value *
                                                  .20,
                                          progressColor: Color(0xFFFDD400),
                                          backgroundColor: Colors.white,
                                          center: Text(
                                            "${_timerAnimationController.value.toInt()}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                VerticalSpace(40.h),
                                Opacity(
                                  opacity: _isStartButton.value ? 0 : 1,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                        color: Colors.white),
                                    child: Text(
                                      "How my data are protected?",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                VerticalSpace(20.h)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 15.h, left: 20.w, child: BackToPreviousScreen()),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
