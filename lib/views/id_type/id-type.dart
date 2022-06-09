import 'package:campost/views/id_type/id_type_constants.dart';
import 'package:campost/views/shared/shared_exports.dart';
import 'package:campost/views/views_exports.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IdTypeView extends StatefulWidget {
  static const routeName = '/id_type';
  const IdTypeView({Key? key}) : super(key: key);

  @override
  State<IdTypeView> createState() => _IdTypeViewState();
}

class _IdTypeViewState extends State<IdTypeView> {
  var _ischoosed = false.obs;
  var _radioButtonData = <RadioModel>[
    RadioModel(false, IdTypeConstants.nationalid),
    RadioModel(false, IdTypeConstants.nationalPassport),
    RadioModel(false, IdTypeConstants.foreignPassport)
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: .5,
                child: Image.asset(
                  SharedConstants.idAndLoginBackground,
                  fit: BoxFit.cover,
                )),
            ScreenPadding(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(15.h),
                    BackToPreviousScreen(
                        filledColor: Colors.white.withOpacity(.4)),
                    Spacer(),
                    Obx(
                      () => DelayedDisplay(
                        delay: const Duration(seconds: 1),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _ischoosed.value
                                ? () {
                                    Get.toNamed(IdScanView.routeName);
                                  }
                                : null,
                            child: Text(
                              "Let's Start",
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpace(40.h),
                  ]),
            ),
            Align(
              alignment: Alignment.center,
              child: ScreenPadding(
                child: DelayedDisplay(
                  slidingBeginOffset: Offset(-1, 1),
                  slidingCurve: Curves.bounceOut,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(.2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 47.h, left: 37.w, right: 37.w),
                          child:
                              Text('Please Select to Scan Your ID from here.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                        ),
                        Obx(
                          () => ListView.builder(
                              itemCount: _radioButtonData.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return DelayedDisplay(
                                  delay:
                                      Duration(milliseconds: (index + 1) * 300),
                                  slidingBeginOffset: Offset(1, 0),
                                  child: RadioItem(
                                    onTap: () {
                                      _ischoosed(true);
                                      for (var element in _radioButtonData) {
                                        element.isSelected = false;
                                      }
                                      _radioButtonData[index].isSelected = true;
                                      _radioButtonData.refresh();
                                    },
                                    isSelected:
                                        _radioButtonData[index].isSelected,
                                    text: _radioButtonData[index].text,
                                  ),
                                );
                              }),
                        ),
                        VerticalSpace(30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const RadioItem({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 16.r,
        backgroundColor: isSelected ? Color(0xFF0019FF) : Color(0xFFF4F2F2),
        child: Icon(
          Icons.check,
          size: 20.sp,
          color: isSelected ? Colors.white : Color(0xFFAEAEAE),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: isSelected ? Color(0xFF0019FF) : Color(0xFFAEAEAE),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
